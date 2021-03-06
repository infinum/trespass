$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'pry'
require 'pg'
require 'active_record'
require 'database_cleaner'

require 'trespass'
require 'trespass/injection_matcher'

TEST_DATABASE_NAME = 'trespass_database'

command = "psql  -c \"create database #{TEST_DATABASE_NAME};\" -U postgres"
system("#{command} > /dev/null 2>&1")

url = "postgres:#{TEST_DATABASE_NAME}"
ActiveRecord::Base.establish_connection(url)

require_relative 'schema'
require_relative 'models'
require_relative 'user_search'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.orm = :active_record
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
