# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.0'

gem 'activerecord', '~> 7.0'
gem 'bcrypt', '~> 3.1.7'
gem 'database_cleaner-active_record', '~> 2.0'
gem 'pg', '~> 1.3'
gem 'rake', '~> 13.0'
gem 'sinatra'
gem 'sinatra-activerecord', '~> 2.0'
gem 'sinatra-contrib'
gem 'rerun'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
