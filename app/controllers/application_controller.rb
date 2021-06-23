require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end


  helpers do 

    def current_user
      @current_user ||= User.find(session[:user_id]) #memoization 
    end

    def logged_in?
      !!session[:user_id]
    end




    def get_post 
      @post =Post.find_by_id(params[:id])
    end

  end

end
