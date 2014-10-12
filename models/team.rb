# encoding: UTF-8
class Team
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :updated_at, DateTime
  property :created_at, DateTime
  
  has n, :players
  belongs_to :coach
end