# encoding: UTF-8
class Team
  include DataMapper::Resource
  property :id, Serial
  property :firstName, String
  property :lastName, String
  property :number, Integer
  property :modified_at, Date
  property :created_at, Date
  
  belongs_to :team

end