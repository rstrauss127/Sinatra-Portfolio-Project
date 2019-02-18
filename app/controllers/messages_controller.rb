class MessagesController < ApplicationController

  get '/messages/' do
    #show messages
  end

  post '/messages' do
    @messages = Messages.create(params)
    @messages.sender = current_user.id
    @messages.recipent
  end

  get '/messages/new' do
    if !logged_in?#checking if logged in
      redirect "/login" #redirect if not
    else
      erb :"/messages/new" #render new message form if they are logged in
      puts params
    end
  end

  post '/messages/new' do
    #send message
  end

  get '/messages/sent' do
    #view sent messages
  end
end
