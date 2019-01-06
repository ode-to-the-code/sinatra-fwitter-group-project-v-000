class TweetsController < ApplicationController


  get '/tweets' do
    # binding.pry
    if current_user
        # binding.pry
      @tweets = Tweet.all
      erb :"tweets/index"
    else 
      redirect "/login"
    end
  end 


end
