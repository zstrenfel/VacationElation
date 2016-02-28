class Destination
  include Mongoid::Document

  field :name, type: String
  field :city, type: String
  field :state, type: String
  field :country, type: String
  field :tags, type: Array
  field :description, type: String
  
  has_many :trips
end
