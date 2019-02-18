class MessagesController < ApplicationController

  get '/messages/' do
    #show messages
  end

  post '/messages' do
    @message = Message.create(params)

    @message.sender_id = current_user.id
    @message.recipient_id = @post.user_id
    redirect :"posts/show"

  end

  get '/messages/new' do
    if !logged_in?#checking if logged in
      redirect "/login" #redirect if not
    else
      erb :"/messages/new" #render new message form if they are logged in
    end
  end

  post '/messages/new' do
    #send message
  end

  get '/messages/sent' do
    #view sent messages
  end
end
