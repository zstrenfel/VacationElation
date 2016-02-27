class User
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :gender, type: String
  field :password, type: String

  has_and_belongs_to_many :trips
end
