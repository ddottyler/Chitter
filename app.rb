require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :homepage 
  end

  get '/create_peep' do
    erb :create_peep
  end 

  post '/new_peep' do 
    p params 
  end

  run! if app_file == $0
end