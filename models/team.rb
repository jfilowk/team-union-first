# encoding: UTF-8
class Team
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :modified_at, Date
  property :created_at, Date
  
  has n, :players
  belongs_to :coach
end