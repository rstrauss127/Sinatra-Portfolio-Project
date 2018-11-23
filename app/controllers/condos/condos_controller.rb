class CondosController < Sinatra::Base

  get '/condos' do
    "Condos Index"
  end

  get 'condos/new' do
    erb :new
  end
end
