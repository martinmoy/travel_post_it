class PostsController < ApplicationController
    # show all the post by the users
    get '/posts' do
        @posts = Post.all
        erb :'posts/index'
    end

    get '/posts/new' do 
        erb :'posts/new'
    end

    #show individual post 

    get '/posts/:id' do
        @post = Post.find_by_id(params[:id])
        erb :'posts/show'
    end

    

    








end