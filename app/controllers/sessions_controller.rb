class SessionsController < ApplicationController

  get '/login' do
    erb :"sessions/login"
  end

  post '/sessions' do
    login(params[:email])#login a user with this eail
    redirect '/posts'
  end

  get '/logout' do
    logout!
    redirect '/posts'
  end
end
