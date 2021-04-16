require 'sinatra/base'
require './lib/peep.rb'
require_relative './database_connection_setup.rb'
require_relative './lib/comment'

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
    Peep.delete(id: params['id'])
    redirect '/'
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(id: params[:id])
    erb :edit_peep
  end

  patch '/peeps/:id' do
    p params 
    Peep.update(id: params[:id], peep: params[:peep])
    redirect('/')
  end

  get '/peeps/:id/comments/new' do
    @peep_id = params[:id]
    erb :new_comment
  end

  post '/peeps/:id/comments' do
    Comment.create(peep_id: params[:id], text: params[:comment])
    redirect '/'
  end

  run! if app_file == $0
end