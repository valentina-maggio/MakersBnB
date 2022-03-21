# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'

class MakersBnB < Sinatra::Base
  configure :development do
    # :nocov:
    register Sinatra::Reloader
    # :nocov:
  end
  register Sinatra::ActiveRecordExtension

  get '/' do
    'Hello World'
  end

  run! if app_file == $PROGRAM_NAME
end
