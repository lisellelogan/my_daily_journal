class UsersController < ApplicationController

    get '/' do 
        if logged_in?
            redirect "/users/#{current_user.id}"
        else  
            erb :'users/index'
        end
    end

    get '/signup' do 
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(name: params[:name], email: params[:email], password: params[:password])
        if user.save
            session[:user_id] = user.id 
            redirect "/users/#{user.id}"
        else  
            @errors = user.errors.full_messages.join(" - ")
            erb :'users/signup'
        end
    end

   get '/login' do 
        erb :'users/login'
   end

   post '/login' do 
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else   
            flash[:message] = "Your credentials were invalid. Please sign up or try again."
            redirect '/login'
        end
   end

   get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        erb :'users/show'
   end

   get '/users/:id/edit' do 
        @user = User.find_by(id: params[:id])
        @journal_entries = JournalEntry.all
        erb :'users/edit'
   end
   
   get '/logout' do 
        session.clear
        redirect '/'
   end

end