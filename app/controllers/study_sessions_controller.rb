class StudySessionsController < ApplicationController
  get '/study_sessions' do
    study_sessions = StudySession.all
    @sum = 0
    study_sessions.each do |session|
      if session.user_id == current_user.id
        @sum += session.length
      end
    end
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
