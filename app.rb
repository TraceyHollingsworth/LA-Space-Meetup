require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'omniauth-github'

require_relative 'config/application'

Dir['app/**/*.rb'].each { |file| require_relative file }

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end

  def signed_in?
    current_user.present?
  end
end

def set_current_user(user)
  session[:user_id] = user.id
end

def authenticate!
  unless signed_in?
    flash[:notice] = 'You need to sign in if you want to do that!'
    redirect '/'
  end
end

get '/' do
  @meetups = Meetup.order('title')
  erb :index
end

get '/meetups/new' do
  erb :new
end

get '/meetups/:id' do
  @id = params[:id]
  @meetup = Meetup.find(@id)
  erb :show
end

post '/' do
  if !signed_in?
    flash[:notice] = "You must be signed in!"
    redirect '/'
  elsif
    @new = Meetup.create(params[:meetup])
    flash.now[:notice] = "You've successfully created a meetup!"
    @new.save
    redirect "/meetups/#{@new.id}"
  else
    redirect '/new'
  end
end

get '/auth/github/callback' do
  auth = env['omniauth.auth']

  user = User.find_or_create_from_omniauth(auth)
  set_current_user(user)
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/example_protected_page' do
  authenticate!
end
