class Destination
  include Mongoid::Document

  field :name, type: String
  field :city, type: String
  field :state, type: String
  field :country, type: String
  field :airports, type: Array
  field :tags, type: Array
  field :description, type: String
  
  has_many :trips

  #this method will return a list of destinatino that order in matching time
  def self.matchTags tags, airport
  	#get all the destinations
  	dest_array = Destination.all

  	#initialize a hash that match all the destinations
  	hash = {}
  	(0..dest_array.count).each do |index|
  		hash[index.to_s] = 0
  	end

  	tags.each do |t|
  		dest_array.each_with_index do |dest, index|
  			if dest["tags"].include?(t) 
  				hash[index.to_s] += 1
  			end
  		end
  	end

  	#sort the hash in descending order
  	hash = hash.sort_by {|_key, value| value}.reverse

  	ret_array = []
  	hash.each do |h|
  		if h[1] != 0 && !dest_array[h[0].to_i].airports.include?(airport)
  			ret_array << dest_array[h[0].to_i]
  		end
  	end

  	return ret_array
  end

end
