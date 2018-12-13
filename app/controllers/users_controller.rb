class UsersController < ApplicationController
  get '/signup' do
    erb :"users/new"
  end

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      erb :"users/new"#render otherwise we lose info
    end
  end
end
#render when the current request has the info we need
