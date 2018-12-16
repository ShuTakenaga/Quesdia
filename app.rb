 #! ruby -EUTF-8
 # -*- mode:ruby; coding:utf-8 -*-
require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'sinatra/flash'
require 'open-uri'
require 'sinatra/json'
require './image_uploader.rb'

enable :sessions

configure :production do
end

helpers do
  def current_user
    User.find_by(id: session[:user])
  end
end


get '/' do
  erb :index
end

get '/ideas' do
  @ideas = Idea.all
  @users = User.all
  @favorites = Idea.all.limit(10).order('created_at desc')
  @favorites = Idea.where(favorite: true)
  erb :ideas
end

get '/favorites' do
  @ideas = Idea.all
  @users = User.all
  @fav = current_user.favorites.all
  erb :favorites
end

get '/newidea' do
  erb :newidea
end

get '/signup' do
  erb :sign_up
end

post '/signup' do
  user = User.create(
      username: params[:username],
      mail: params[:mail],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
  )
  if user.persisted?
    session[:user] = user.id
    flash[:notice] = '登録が完了しました'
    redirect '/'
  else
    flash[:notice] = 'すでに登録をされているメールアドレスを使用されている。または、パスワードが正しくありません'
    redirect '/signup'
  end
end

get '/signin' do
  erb :sign_in
end

post '/signin' do
  user = User.find_by(mail: params[:mail])
  if user&.authenticate(params[:password])
    session[:user] = user.id
    flash[:notice] = 'ログインしました'
    redirect '/'
  else
    flash[:notice] = 'メールアドレス、もしくはパスワードが間違っています'
    redirect '/signin'
  end
end

get '/signout' do
  session[:user] = nil
  redirect '/'
end

post '/ideas' do
  current_user.ideas.create(
      description: params[:description],
      about: params[:about],
      concept: params[:concept],
      name: params[:name],
      core: params[:core].inspect,
      sab: params[:sab].inspect,
      technology: params[:technology].inspect,

      age: params[:age],
      gender: params[:gender],
      target_user: params[:target_user],

      whom: params[:whom],
      when: params[:when],
      where: params[:where],
      why: params[:why],
      how: params[:how],
      howmany: params[:howmany],
      howmuch: params[:howmuch],
      howlong: params[:howlong],
      last: params[:last],
      servicename: params[:servicename].inspect,
      servicedifference: params[:servicedifference],
      email: params[:email],
      other: params[:other],
      img: "",
      user_id: current_user.id
  )

  if params[:file]
    image_upload(params[:file])
  end

  redirect '/ideas'
end

get '/ideas/:id/information' do
  @idea = Idea.find(params[:id])
  erb :information
end

post '/ideas/:id' do
  idea = Idea.find(params[:id])
  idea.description = params[:description]
  idea.save
  redirect '/'
end

post '/ideas/:id/delete' do
  @idea = Idea.find_by(user_id: params[:user_id])
  idea = Idea.find(params[:id])
  idea.delete
  redirect '/ideas'
end

post '/ideas/:id/update' do
  if current_user.favorites.where(idea_id: params[:id]).blank? then
  current_user.favorites.create(
    idea_id: params[:id]
  )
  else
    fav = current_user.favorites.where(idea_id: params[:id])
    fav.destroy_all
  end
  redirect '/ideas'
end

get '/dashboard' do
  erb :dashboard
end

post '/dashboard' do
  flash[:notice] = '画像を変更しました'
  redirect '/dashboard'
end