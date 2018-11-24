class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #enable :sessions
    #set :session_secret, "carcollection"
  end

  get '/' do
    "Welcome to our Vacation rental site. If you own a vacation property and would like to list it, click here___.
    If you would like to sign up to see available vacations, click here_____"
  end


  get '/signup' do
    erb :signup
  end

  post '/signup' do
    
  end

  get '/condos' do
    "Condos Index"
  end

  get '/condos/new' do
    erb :"/condos/new"
  end
end
