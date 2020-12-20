class UsersController < ApplicationController

    #signup
    get '/signup' do
        @users = User.all
        erb :'users/new'
    end

    #load form

    #process form + create user
    ##creating the user AND logging them in

end