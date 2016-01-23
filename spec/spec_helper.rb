$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'pry'
require 'pg'
require 'active_record'
require 'database_cleaner'

require 'dirty_deed'
require 'dirty_deed/injection_matcher'

TEST_DATABASE_NAME = 'dirty_deed_database'

command = "psql  -c \"create database #{TEST_DATABASE_NAME};\" -U postgres"
system("#{command} > /dev/null 2>&1")

url = "postgres:#{TEST_DATABASE_NAME}"
ActiveRecord::Base.establish_connection(url)

require File.dirname(__FILE__) + '/schema.rb'
require File.dirname(__FILE__) + '/models.rb'
require File.dirname(__FILE__) + '/user_search.rb'

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
