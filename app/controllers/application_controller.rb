class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "carcollection"
  end

  get '/' do
    erb :"sessions/index"
  end


  helpers do

    def logged_in?
      !!current_user
    end

    def login(email, password)
      user = User.find_by(:email => email)
      if user && user.authenticate(password)  #check if a user with this email actually exists and we can autheticate this user witht his password
        session[:email] = user.email      #if so, set the session
      else
        redirect '/login'#otherwise, return false or redirext '/login'
      end
    end

    def logout!
      session.clear
    end

    def current_user
      @current_user ||= User.find_by(:email => session[:email]) if session[:email] #if the session has an email and we can find the user by that email
    end

  end#end of helper methods

end
