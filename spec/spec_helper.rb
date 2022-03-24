# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner/active_record'
require 'active_support'
require 'features/web_helpers'

DatabaseCleaner.strategy = :truncation

ENV['RACK_ENV'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console
                                                               ])
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', '/app')
Capybara.app = MakersBnB

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.clean
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
