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
            raise
        else
            @result = "Sorry but #{@score} doesn't seem to be a valid English word"
        end
        call_api
    end

    def call_api
        require 'json'
        require 'open-uri'
    
        url = 'https://wagon-dictionary.herokuapp.com/'
        user_serialized = URI.open(url).read
        user = JSON.parse(user_serialized)

    end
end


