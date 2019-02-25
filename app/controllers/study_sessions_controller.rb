class StudySessionsController < ApplicationController
  get '/study_sessions' do
    @current_user = current_user
    @study_sessions = StudySession.all
    erb :"study_sessions/index"
  end

  post '/study_sessions' do
    @study_session = StudySession.create(params)
    redirect "/posts"
  end

  get '/study_sessions/new' do
    if !logged_in?#checking if logged in
      redirect "/login" #redirect if not
    else
      @current_user = current_user
      erb :"/study_sessions/new" #render new post form if they are logged in
    end
  end
end
