require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

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

  delete '/peeps/:id' do
    p params
    Peep.delete(id: params['id'])
    redirect '/'
  end

  get '/peeps/:id/edit' do
    @peep_id = params[:id]
    erb :edit_peep
  end

  patch '/peeps/:id' do
    Peep.update(id: params[:id], peep: params[:peep])
    redirect('/')
  end

  run! if app_file == $0
end