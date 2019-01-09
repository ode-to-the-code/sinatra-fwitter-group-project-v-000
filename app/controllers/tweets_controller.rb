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
    # binding.pry
    if logged_in?
      # binding.pry
      erb :"tweets/new"
    else 
      # binding.pry
      redirect to "/login"
    end 
    
    # erb :"tweets/new"
  end 
  
  post '/tweets' do 
    # binding.pry
    if !params[:content].empty? 
      @tweet = Tweet.new(content: params[:content], user_id: session[:user_id]) 
      # binding.pry
      @tweet.save
      redirect "/tweets/#{@tweet.id}"
    else 
      redirect "/tweets/new"
    end 

  end 
  
  get '/tweets/:id' do 
    if logged_in?
      @tweet = Tweet.find_by(id: params[:id])
      erb :"tweets/show"
    else 
      redirect "/login"
    end 
  end 
  
  get '/tweets/:id/delete' do 
    if logged_in?
      @tweet = Tweet.find_by(id: params[:id])
      @tweet.delete 
      redirect to '/index'
    else 
      redirect to "/login"
    end 
  end 


end
