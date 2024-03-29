# frozen_string_literal: true

require 'sinatra/base'
require './lib/peep'
require_relative './database_connection_setup'
require_relative './lib/comment'
require_relative './lib/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    @user = User.find(id: session[:userid])
    @peeps = Peep.all
    erb :homepage
  end

  get '/create_peep' do
    erb :create_peep
  end

  post '/new_peep' do
    Peep.create(peep: params[:peep], userid: session[:userid])
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

  get '/users/new' do
    erb :new_user
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'], username: params['username'])
    session[:userid] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :new_session
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:userid] = user.id
      redirect('/')
    else
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end
