# encoding: UTF-8
class Player
  include DataMapper::Resource
  property :id, Serial
  property :firstName, String
  property :lastName, String
  property :number, Integer
  property :updated_at, DateTime
  property :created_at, DateTime
  
  belongs_to :team

end