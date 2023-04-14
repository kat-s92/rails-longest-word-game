require "open-uri"
class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @user_input = params[:userword]
    @letters = params[:letters].split
    @included = included?(@user_input, @letters)
    @check_english = check_english?(@user_input)
  end

  def included?(user_input, letters)
    user_input.chars.all? { |letter| user_input.count(letter) <= letters.count(letter) }
    # raise
  end
  # are the letters of the word in the grid?
  #  if yes > API call to check the validity of the word in English
  # if both are true you win

  def check_english?(user_input)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{user_input}")
    jason = JSON.parse(response.read)
    jason['found']
    # api check_letters_valid ...
    # true/false
    # if true > api call
  end
end
