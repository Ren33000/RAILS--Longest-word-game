require 'open-uri'

class GamesController < ApplicationController
   
    def new
        @letters = ('a'..'z').to_a.sample(10)
    end

    def score
        @score = params[:user_answer]
        @selected_letters = params[:selected_letters]

        @result = ""

        if @score == @selected_letters && 
            @result ="Congratulations!#{@score} is a valid English word"
        elsif @score != @selected_letters
            @result = "Sorry but #{@score} can't be built out of #{@selected_letters}"
        else
            @result = "Sorry but #{@score} doesn't seem to be a valid English word"
        end
    end

    def english_word?(word)
        url = ('https://wagon-dictionary.herokuapp.com/#{word}')
        user_serialized = URI.open(url).read
        user = JSON.parse(user_serialized)
    end
end


