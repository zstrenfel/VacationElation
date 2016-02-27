class Trip
  include Mongoid::Document

  field :date_start, type: String
  field :date_end, type: String
  field :departure_airport, type: String 
  field :hotel_prices, type: Array
  field :depart_price, type: Integer
  field :return_price, type: Integer
  field :destination_id
  
  has_one :destination 

  def self.mongo_client
		Mongoid::Clients.default
  end

  def self.collection
		mongo_client["trips"]
  end
end
