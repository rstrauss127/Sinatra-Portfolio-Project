class StudySessionsController < ApplicationController

  get '/study_sessions' do
    if !logged_in?
      redirect "/login"
    else
      study_sessions = StudySession.all
      @sum = 0
      study_sessions.each do |session|
        if session.user_id == current_user.id
          @sum += session.length
        end
      end
      erb :"study_sessions/index"
    end
  end

  post '/study_sessions' do
    @study_session = StudySession.create(params)
    redirect "/posts"
  end

  get '/study_sessions/new' do
    if !logged_in?
      redirect "/login"
    else
      @current_user = current_user
      erb :"/study_sessions/new"
    end
  end
end
