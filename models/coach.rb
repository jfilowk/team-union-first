# encoding: UTF-8
class Coach
  include DataMapper::Resource
  property :id, Serial
  property :firstName, String
  property :lastName, String
  property :password, String
  property :created_at, Date
  
  has n, :teams

end