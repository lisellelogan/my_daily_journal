class UsersController < ApplicationController

    #index action
    ##ask user if want to login or signup
    get '/' do 
        if logged_in?
            redirect "/users/#{current_user.id}"
        else  
            erb :'users/index'
        end
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
            # display full error messages if not correct
            errors = user.errors.full_messages
            redirect '/signup'
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
            redirect '/login'
        end
   end

   get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        erb :'users/show'
   end

   get '/users/:id/edit' do 
        #find the user
        @user = User.find_by(id: params[:id])
        #get the post
        @journal_entries = JournalEntry.all
        #render the edit page
        erb :'users/edit'
   end
   
   #logout
   get '/logout' do 
        session.clear
        redirect '/'
   end

   #delete journal entries

end