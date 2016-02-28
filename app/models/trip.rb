class Trip
  include Mongoid::Document
  attr_accessor :data_start, :date_end, :departure_airport, :hotel_prices, :depart_price, :return_price, :destination_id

  field :date_start, type: String
  field :date_end, type: String
  field :departure_airport_leave, type: String 
  field :departure_airport_back, type: String
  field :arrival_airport_leave, type: String
  field :arrival_airport_back, type: String
  field :hotel_prices, type: Array
  field :depart_price, type: Integer
  field :return_price, type: Integer
  field :destination_id
  
  belongs_to :destination
  has_and_belongs_to_many :users

  def self.mongo_client
		Mongoid::Clients.default
  end

  def self.collection
		mongo_client["trips"]
  end
end
