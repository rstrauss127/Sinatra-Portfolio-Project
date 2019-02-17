class MessagesController < ApplicationController

  get '/messages/' do
    #show messages
  end

  get '/messages/new' do
    #create a new message
  end

  post '/messages/new' do
    #send message
  end

  get '/messages/sent' do
    #view sent messages
  end
end
