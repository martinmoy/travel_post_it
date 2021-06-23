class UsersController < ApplicationController
    #signup
    get '/signup' do 
        erb :"users/signup"
    end

    post '/signup' do
       
        user = User.new(params)
        if user.name.blank? || user.email.blank? || user.password.blank? || User.find_by_email(params[:email])
            redirect '/signup'
        else
            user.save
            session[:user_id] = user.id #logging user in 
            redirect '/posts'
        end
    end

    get '/login' do 
        erb :"users/login"
    end

    post '/login' do 
        email = User.find_by_email(params[:email])
        
        if email && email.authenticate(params[:password])
            session[:user_id] = email.id
            redirect '/posts'
        else
            flash[:error] = "Invalid Login"
            redirect '/login'

        end
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end






end