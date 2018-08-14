class UsersController < ApplicationController


  get '/' do  
    @users = User.all
    erb :index
  end 
  
  get '/signup' do
    erb :'users/create_user'
  end 
  
  post '/signup' do
    #create new user 
  end 

end
