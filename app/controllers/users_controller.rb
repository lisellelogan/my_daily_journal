class UsersController < ApplicationController

    #index action
    ##ask user if want to login or signup
    get '/' do 
        erb :'users/index'
    end

    #signup
    get '/signup' do
        @users = User.all
        erb :'users/new'
    end

    #load form

    #process form + create user
    ##creating the user AND logging them in

end