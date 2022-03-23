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
    p @spaces
    erb :spaces
  end

  get '/spaces/:id' do
    @space = Space.find_by(id: params[:id])
    # Availability logic here
    erb(:select_a_date)
  end

  post '/add_booking/:id' do
    session[:booking] = Booking.create(space_id: params[:id],user_id: session[:user_id],date: params[:date],status_id: 1)
    redirect '/confirmation'
  end

  get '/confirmation' do
    @booking = session[:booking]
    @space = Space.find_by(id: @booking.space_id)
    @status = Status.find_by(id: @booking.status_id)
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
      #redirect('/')
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
      #redirect '/'
      redirect '/spaces'
    else
      flash[:notice] = 'One of the required field is empty or contains invalid data; please check your input.'
      redirect '/sign_in'
    end
  end

  delete '/sessions' do
    session.delete(:user_id)
    #redirect '/sign_in'
    redirect '/'
  end

  post '/spaces/list' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], available_from: params[:available_from], available_to: params[:available_to], picture: nil)
    redirect '/spaces'
  end

  get '/requests/:id' do
    # @made_requests = Booking.where(user_id: params[:id])
    @made_requests = Space.joins(:bookings).select("bookings.date, bookings.status_id, spaces.name").where(:user_id => params[:user_id])
    # p "This is the join: #{(Space.joins(:bookings).select("bookings.id, spaces.name")[1])}"
    # @made_requests = Booking.where(:user_id => params[:id])
    # @made_requests = Booking.where("user_id = #{params[:id]}")
    p @made_requests
    erb :requests
  end

  run! if app_file == $PROGRAM_NAME
end
