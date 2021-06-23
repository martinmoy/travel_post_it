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
        @post = Post.new(params)
        @post.user_id = session[:user_id]
        @post.save
        #user.posts.build(params) 
        redirect "posts/#{@post.id}"
    end


    get '/posts/:id' do
        get_post
        erb :'posts/show'
    end


    get '/posts/:id/edit' do 
        get_post
        if @post.user_id == current_user
            erb :'posts/edit'
        else
            flash[:error] = "You are not the owner of this post"
            redirect '/posts'
        end
    end


    patch '/posts/:id' do
        get_post
        if @post.user_id == current_user
            @post.update(title: params[:title], content: params[:content])
            redirect to "/posts/#{@post.id}"
        else
            flash[:error] = "You are not the owner of this post"
            redirect '/posts'
        end
    end

    delete '/posts/:id' do
        get_post
        @post.destroy
        redirect '/posts'
    end

    


end