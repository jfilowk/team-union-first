# encoding: UTF-8
class Coach
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :nickname, String
  property :password, String
  property :updated_at, DateTime
  property :created_at, DateTime
  
  has n, :teams
end