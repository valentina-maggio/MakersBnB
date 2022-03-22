# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/user'
require './lib/space'
require './lib/booking'
require './lib/status'

class MakersBnB < Sinatra::Base
  configure :development do
    # :nocov:
    register Sinatra::Reloader
    # :nocov:
  end
  register Sinatra::ActiveRecordExtension

  enable :sessions

  get '/' do
    # Get all the spaces listed by the user with id 1
    #User.find_by(id: 1).spaces

    # "SELECT first_name FROM spaces JOIN users ON (spaces.user_id = users.id);"
    erb(:index)
  end

  get '/spaces/list' do
    erb :list
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/:id' do
    @space = Space.find_by(id: params[:id])
    # Availability logic here
    erb(:select_a_date)
  end

  post '/add_booking/:id' do
    session[:booking] = Booking.create(space_id: params[:id],user_id: 1,date: params[:date],status_id: 1)
    redirect '/confirmation'
  end

  get '/confirmation' do
    @booking = session[:booking]
    @space = Space.find_by(id: @booking.space_id)
    @status = Status.find_by(id: @booking.status_id)
    erb(:confirmation)
  end

  get '/registrations/new' do
    erb(:'registrations/new')
  end
  
  post '/registrations' do
    user = User.new(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: "")
    user.password = params[:password]
    user.save!
    redirect('/')

  end

  post '/spaces/list' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_to: params[:available_to], picture: nil)
    redirect '/spaces'
  end

  run! if app_file == $PROGRAM_NAME
end
