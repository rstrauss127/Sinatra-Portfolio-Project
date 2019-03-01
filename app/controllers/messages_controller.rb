class MessagesController < ApplicationController

  get '/messages' do
    if !logged_in?
      redirect "/login"
    else
      @messages = Message.all
      erb :"/messages/index"
    end
  end

  post '/messages/new' do
    @message = Message.create(params)
    redirect :"posts"
  end

  get '/messages/new/:id' do
    if !logged_in?
      redirect "/login"
    else
      @author = User.find_by_id(params[:id])
      @current_user = current_user#shouldnt be neccessaery
      erb :"/messages/new"
    end
  end
  
end
