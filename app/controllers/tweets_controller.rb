class TweetsController < ApplicationController


  get '/' do  
    @tweets = Tweet.all
    erb :index
  end 


end
