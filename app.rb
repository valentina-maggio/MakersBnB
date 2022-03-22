# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/user'
require './lib/space'

class MakersBnB < Sinatra::Base
  configure :development do
    # :nocov:
    register Sinatra::Reloader
    # :nocov:
  end
  register Sinatra::ActiveRecordExtension

  get '/' do
    # Get all the spaces listed by the user with id 1
    User.find_by(id: 1).spaces
 
    

    # "SELECT first_name FROM spaces JOIN users ON (spaces.user_id = users.id);"
    erb(:index)
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  run! if app_file == $PROGRAM_NAME
end
