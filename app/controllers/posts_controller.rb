class PostsController < ApplicationController

  get '/posts' do
    "You are logged in as #{session[:email]}"
  end

  get '/posts/new' do
    #checking if logged in
    if !logged_in?
      redirect "/login" #redirect if not
    else
      "A new post form" #rendering if they are
    end
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
