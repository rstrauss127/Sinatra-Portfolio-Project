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
      "An edit post form" #rendering if they are
    end
  end

end
