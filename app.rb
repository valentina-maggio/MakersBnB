# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/user'
require './lib/space'
require './lib/booking'
require './lib/status'
require 'sinatra/flash'

class MakersBnB < Sinatra::Base
  configure :development do
    # :nocov:
    register Sinatra::Reloader
    # :nocov:
  end
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  enable :sessions
  enable :method_override

  get '/' do
    erb(:index)
  end

  get '/spaces/list' do
    redirect '/' unless session[:user_id]
    erb :list
  end

  get '/spaces' do
    redirect '/' unless session[:user_id]
    @spaces = Space.all.where.not(user_id: session[:user_id])
    erb :spaces
  end

  post '/spaces/available' do
    session[:desired_start_date] = params[:available_from]
    session[:desired_end_date] = params[:available_to]
    redirect '/spaces/available'
  end

  get '/spaces/available' do
    redirect '/' unless session[:user_id]
    @spaces = Space.all.where.not(user_id: session[:user_id])
    @spaces = @spaces.where('available_from <= ? AND ? <= available_to', session[:desired_end_date].to_date, session[:desired_start_date].to_date)
    erb :available_spaces
  end

  get '/spaces/:id' do
    redirect '/' unless session[:user_id]
    space = Space.find_by(id: params[:id])
    available_from = space.available_from
    available_to = space.available_to
    @available_date_arr = (available_from.to_date..available_to).map{ |date| date }
    

    @space = Space.find_by(id: params[:id])
    # Availability logic here
    erb(:select_a_date)
  end

  post '/add_booking/:id' do
    session[:booking] = Booking.create(space_id: params[:id],user_id: session[:user_id],date: params[:date_selector],status_id: 1)
    redirect '/confirmation'
  end

  get '/confirmation' do
    redirect '/' unless session[:user_id]
    @booking = session[:booking]
    @space = @booking.space
    @status = @booking.status
    erb(:confirmation)
  end

  post '/sign_up' do
    redirect '/registrations/new'
  end

  get '/registrations/new' do
    erb(:'registrations/new')
  end
  
  post '/registrations' do
    user = User.new(email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: "")
    user.password = params[:password]

    begin 
      user.save!
    rescue ActiveRecord::RecordInvalid
      flash[:notice] = 'One of the required field is empty or contains invalid data; please check your input.'
      redirect '/registrations/new'
    else
      session[:user_id] = user.id
      redirect '/spaces'
    end
  end

  post '/log_in' do
    redirect '/sign_in'
  end

  get '/sign_in' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.find_by(email: params[:email])

    if !user
      flash[:notice] = 'One of the required field is empty or contains invalid data; please check your input.'
      redirect '/sign_in'
    end

    if user.authenticate(params[:password]) 
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash[:notice] = 'One of the required field is empty or contains invalid data; please check your input.'
      redirect '/sign_in'
    end
  end

  delete '/sessions' do
    session.delete(:user_id)
    redirect '/'
  end

  post '/spaces/list' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_to: params[:available_to], picture: nil, user_id: session[:user_id])
    redirect '/spaces'
  end

  get '/requests' do
    redirect '/' unless session[:user_id]
    user = User.find_by(id: session[:user_id])
    @made_requests = user.bookings.order(id: :asc)
    
    @user_spaces = user.spaces
    erb :requests
  end

  patch '/requests/update/:id' do
    booking = Booking.find_by(id: params[:id])
    p params[:status_update]
    booking.status_id = 2 if params[:status_update] == 'Confirm booking'
    booking.status_id = 3 if params[:status_update] == 'Reject booking'
    booking.save!
    redirect '/requests'
  end

  run! if app_file == $PROGRAM_NAME
end
