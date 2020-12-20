class UsersController < ApplicationController

    #index
    get '/users' do
        @users = User.all
        erb :'users/index'
    end

    #show

    #new

    #create

    #edit

    #update

    #destroy

end