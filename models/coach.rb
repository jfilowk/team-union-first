# encoding: UTF-8
class Coach
  include DataMapper::Resource
  property :id, Serial
  property :firstName, String
  property :lastName, String
  property :password, String
  property :updated_at, DateTime
  property :created_at, DateTime
  
  has n, :teams
end