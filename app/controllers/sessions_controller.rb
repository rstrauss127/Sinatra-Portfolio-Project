class SessionsController < ApplicationController

  get '/login' do
    erb :"sessions/login"
  end

  post '/sessions' do
    login(params[:email], params[:password])
    redirect '/study_sessions'
  end

  get '/logout' do
    logout!
    redirect '/login'
  end
end
