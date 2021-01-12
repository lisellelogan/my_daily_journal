require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "therapy_session"
    register Sinatra::Flash
  end

  helpers do 
    def logged_in? 
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in? 
        redirect '/'
      end
    end

    def not_authorized_to_edit
      if @journal_entry.user != current_user 
          redirect "/users/#{current_user.id}"
      end
    end
  end
end
