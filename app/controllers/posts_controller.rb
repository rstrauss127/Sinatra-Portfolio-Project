class PostsController < ApplicationController

  get '/posts' do #show all posts???
    @posts = Post.all
    erb :"/posts/show"
  end

  get '/posts/new' do
    #checking if logged in
    if !logged_in?
      redirect "/login" #redirect if not
    else
      erb :"/posts/new" #render new post form if they are logged in
    end
  end

  post '/posts' do
    @post = Post.create(params)
    @post.user_id = current_user.id
    @post.save
    puts params
  end

  get '/posts/:id/edit' do
    #checking if logged in
    if !logged_in?
      redirect "/login" #redirect if not
    else
      if post = current_user.posts.find_by(params[:id])      #only get posts the user is allowed to edit
        "An edit post form #{current_user.id} is editing #{post.id}"  #rendering if they are
      else
        redirect '/posts'
      end
    end
  end

end
