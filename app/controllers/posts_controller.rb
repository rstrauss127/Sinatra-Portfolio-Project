class PostsController < ApplicationController

  get '/posts' do #posts index action
    @posts = Post.all
    erb :"/posts/index"
  end

  get '/posts/new' do#new
    if !logged_in?#checking if logged in
      redirect "/login" #redirect if not
    else
      erb :"/posts/new" #render new post form if they are logged in
    end
  end

  post '/posts' do#create
    @post = Post.create(params)
    @post.user_id = current_user.id
    @post.save
    redirect "posts/#{@post.id}"
    puts params
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @author = User.find_by_id(@post.user_id)
    erb :"posts/show"
  end

  get '/posts/:id/edit' do #edit form
    if !logged_in?#checking if logged in
      redirect "/login" #redirect if not
    else
      if post = current_user.posts.find_by(params[:id])#only edit posts the user has authored
        @post = Post.find_by_id(params[:id])
        erb :"posts/edit"  #rendering if they are
      else
        redirect '/posts'
      end
    end
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end


  delete '/posts/:id/delete' do
    if !logged_in?#checking if logged in
      redirect "/login" #redirect if not
    else
      if post = current_user.posts.find_by(params[:id])#only edit posts the user has authored
        @post = Post.find_by_id(params[:id])
        @post.delete
        erb :"/posts"  #rendering if they are
      else
        redirect '/posts'
      end
    end
  end
end
