class MessagesController < ApplicationController

  get '/messages' do
    if !logged_in?#checking if logged in
      redirect "/login" #redirect if not
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
    if !logged_in?#checking if logged in
      redirect "/login" #redirect if not
    else
      @author = User.find_by_id(params[:id])
      @current_user = current_user
      erb :"/messages/new" #render new message form if they are logged in
    end
  end
end
