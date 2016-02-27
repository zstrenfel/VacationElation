class User
  include Mongoid::Document

  has_many :trips

  field :name, type: String
  field :email, type: String
  field :gender, type: String
  field :password, type: String
end
