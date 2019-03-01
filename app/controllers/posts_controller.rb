class PostsController < ApplicationController

  get '/posts' do
    @posts = Post.all
    erb :"/posts/index"
  end

  get '/posts/new' do
    if !logged_in?
      redirect "/login"
    else
      erb :"/posts/new"
    end
  end

  post '/posts' do
    @post = Post.create(params)
    @post.user_id = current_user.id
    @post.save
    redirect "posts/#{@post.id}"
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @author = User.find_by_id(@post.user_id)
    erb :"posts/show"
  end

  get '/posts/:id/edit' do
    if !logged_in?
      redirect "/login"
    else
      if post = current_user.posts.find_by(params[:id])#only edit posts the user has authored
        @post = Post.find_by_id(params[:id])
        erb :"posts/edit"
      else
        redirect '/posts'
      end
    end
  end

  patch '/posts/:id' do #use update
    @post = Post.find_by_id(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    if !logged_in?
      redirect "/login"
    else
      if post = current_user.posts.find_by(params[:id])
        @post = Post.find_by_id(params[:id])
        @post.delete
        redirect to "/posts"
      else
        redirect '/posts'
      end
    end
  end

end
