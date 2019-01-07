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
  
  get '/tweets/new' do 
    erb :"tweets/new"
  end 
  
  post '/tweets/new' do 
    # binding.pry
    @tweet = Tweet.new(content: params[:content])
  end 


end
