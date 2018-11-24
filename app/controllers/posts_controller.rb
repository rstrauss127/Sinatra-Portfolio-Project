class PostsController < ApplicationController

  get '/posts' do
    "You are logged in as #{session[:email]}"
  end

  get '/posts/new' do
    #checking if logged in
    if !session[:email]
      redirect "/login" #redirect if not
    else
      "A new post form" #rendering if they are
    end
  end

  get '/logout' do
    sessions.clear
  end

end
