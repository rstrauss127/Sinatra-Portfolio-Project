class PostsController < ApplicationController

  get '/posts' do
    "You are logged in as #{sessiom[:email]}"
  end
end
