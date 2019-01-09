class TweetsController < ApplicationController

# make a login helper method, it converts the value of current user to a boolean so its true or false 

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
  
  post '/tweets' do 
    binding.pry
    @tweet = Tweet.new(content: params[:content], user_id: params[:session_id])
    @tweet.save
    redirect "/tweets/#{@tweet.id}"
  end 
  
  get '/tweets/:id' do 
    erb :"tweets/show"
  end 


end
