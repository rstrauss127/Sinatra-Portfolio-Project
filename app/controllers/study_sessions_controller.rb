class StudySessionsController < ApplicationController

  get '/study_sessions' do
    @study_sessions = StudySession.all
    erb :"study_sessions/index"
  end

  post '/study_sessions' do
    @study_session = StudySession.create(params)
    @study_session.user_id = current_user.id
    @study_session.save
    redirect "/posts"
  end

  get '/study_sessions/new' do
    if !logged_in?
      redirect "/login"
    else
      erb :"/study_sessions/new"
    end
  end
end
