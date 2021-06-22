class PostsController < ApplicationController
    # show all the post by the users
    get '/posts' do
        @posts = Post.all
        erb :'posts/index'
    end

    get '/posts/new' do 
        erb :'posts/new'
    end


    post '/posts' do 
        @post = Post.create(params)
        redirect "posts/#{@post.id}"
    end


    get '/posts/:id' do
        @post = Post.find_by_id(params[:id])
        erb :'posts/show'
    end

    

    get '/posts/:id/edit' do 
        @post = Post.find_by_id(params[:id])
        erb :'posts/edit'
    end


    patch '/posts/:id' do
        @post = Post.find_by_id(params[:id])
        @post.update(title: params[:title], content: params[:content])
        redirect to "/posts/#{@post.id}"
    end

    delete '/posts/:id' do
        @post =Post.find_by_id(params[:id])
        @post.destroy
        redirect '/posts'
    end

    


end