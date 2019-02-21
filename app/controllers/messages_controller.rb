class MessagesController < ApplicationController

  get '/messages/' do
    #show messages
  end

  post '/messages/new' do
    puts params
    @message = Message.create(params)
    @message.sender_id = current_user.id
    redirect :"posts"
  end

  get '/messages/new/:id' do
    if !logged_in?#checking if logged in
      redirect "/login" #redirect if not
    else
      @author = User.find_by_id(params[:id])

      erb :"/messages/new" #render new message form if they are logged in
    end
  end
end
