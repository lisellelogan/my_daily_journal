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

    #process signup
    post '/signup' do
        @user = User.new(name: params[:name], email: params[:email], password: params[:password])

        if @user.save
            redirect '/login'
        else  
            redirect '/failure'
        end
    end

   #login
   get '/login' do 
        erb :'users/login'
   end

   #process login
   post '/login' do 
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/success'
        else  
            redirect '/failure'
        end
   end

   get '/success' do 
        if logged_in?
            erb :'users/success'
        else  
            redirect '/login'
        end
   end


    #process form + create user
    ##creating the user AND logging them in

end