require './config/environment'
require 'pry'

# the application controller is the umbrella one that the other two inherit from. like the helper methods 
# apply to either users or tweets. The other two are there more to organize the code for separation of #
# concerns 
# when people say code looks good, its in the context that usually other people will be reading the code. 
# so it shoudl be readable and organized- they have to know where to look. if i'm looking for somethign to # do with tweets and i'm on a team i know its most likely in the tweets controller 
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    
# this part enables cookies. like in avis video there wouldn't be cookies when you test in the browser
# this is separate from bcrypt, it sets and encrypts cookies while bcrypt is more for setting and encrypting passwords in your database
    enable :sessions
    set :session_secret, "secret"
  end
  
  
  get '/' do 
    "Welcome to Fwitter"
    erb :index
    # binding.pry
  end 
  
  helpers do 
    
  # this method just extracts the current user at that moment. it's so you don't have to manually write this code and query the database. this method queries the user table. 
      def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      end 
      
      def logged_in?
        !!current_user
      end 
      
 
  
  end 
  
  # get '/signup' do
  #   redirect '/tweets'
  # end 

  # post '/signup' do 
  #   redirect '/tweets'
  # end 

end
