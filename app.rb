require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :homepage 
  end

  get '/create_peep' do
    erb :create_peep
  end 

  post '/new_peep' do 
    Peep.create(peep: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end