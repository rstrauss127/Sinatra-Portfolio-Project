class StudySessionsController < ApplicationController

  get '/study_sessions' do
    @study_sessions = StudySession.all
    erb :"study_sessions/index"
  end

  get '/study_sessions/new' do
    if !logged_in?
      redirect "/login"
    else
      erb :"/study_sessions/new"
    end
  end

  post '/study_sessions' do
    @study_session = StudySession.create(params)
    @study_session.user_id = current_user.id
    @study_session.save
    redirect "/study_sessions"
  end

  get '/study_sessions/:id' do
    @study_session = StudySession.find_by_id(params[:id])
    erb :"study_sessions/show"
  end

  get '/study_sessions/:id/edit' do
    @study_session = StudySession.find_by_id(params[:id])
    if @study_session.user_id == current_user.id
      erb :"study_sessions/edit"
    else
      redirect :"/study_sessions"
    end
  end

  patch '/study_sessions/:id' do
    @study_session = StudySession.find_by_id(params[:id])
    @study_session.topic = params[:topic]
    @study_session.length = params[:length]
    @study_session.description = params[:description]
    @study_session.save
    redirect to "/study_sessions/#{@study_session.id}"
  end
end
