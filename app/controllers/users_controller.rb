class UsersController < ApplicationController

    #index action
    ##ask user if want to login or signup
    get '/' do 
        erb :'users/index'
    end

    #new - signup
    get '/signup' do 
        @users = User.all
        erb :'users/signup'
    end

    #process signup (creates user)
    post '/signup' do
        user = User.new(name: params[:name], email: params[:email], password: params[:password])
        if user.save
            session[:user_id] = user.id #logs user in and keeps track of who is logged in
            redirect "/users/#{user.id}"
        else  
            redirect '/failure'
        end
    end

   #login
   get '/login' do 
        erb :'users/login'
   end

   #process login (creates session)
   post '/login' do 
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password]) #verifying the user is in the database
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else   
            redirect '/failure'
        end
   end

   get '/users/:id' do 
        if logged_in?
            erb :'users/show'
        else  
            redirect '/login'
        end
   end

   get '/failure' do
        erb :'users/failure'
   end
   
   #logout
   get '/logout' do 
        session.clear
        redirect '/'
   end

   #delete journal entries

end