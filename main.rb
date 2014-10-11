require 'json'
require 'sinatra'
require "data_mapper"
require "dm-types"
require "dm-migrations"
require 'dm-timestamps'


configure :development do
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end

require './models/init'
require './helpers/init'
require './routes/init'

DataMapper.finalize