require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    
    enable :sessions
    set :session_secret, "secret"
  end
  
  
  get '/' do 
    "Welcome to Fwitter"
    erb :index
    # binding.pry
  end 
  
  helpers do 
    
      def current_user
        @current_user ||= User.find_by(id: session[:id]) if session[:id]
      end 
      
      def logged_in?
        session[:id] == @current_user.id
      end 
  
  end 
  
  # get '/signup' do
  #   redirect '/tweets'
  # end 

  # post '/signup' do 
  #   redirect '/tweets'
  # end 

end
