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
    erb :"posts/show"
  end

  get '/posts/:id/edit' do
    if !logged_in?#checking if logged in
      redirect "/login" #redirect if not
    else
      if post = current_user.posts.find_by(params[:id])#only edit posts the user has authored
        erb :"posts/edit"  #rendering if they are
      else
        redirect '/posts'
      end
    end
  end

end
