class ExpediaWS
  include HTTParty

  base_uri 'http://terminal2.expedia.com/x'
  default_params :output => 'json'
  format :json

  @query = {:apikey => "7p76BRYgNg4U4Map8Gad5p2mjcxBikEv"}

  #http://terminal2.expedia.com/x/mflights
  #/search?departureAirport=LAX&arrivalAirport=ORD&departureDate=2016-04-22&childTravelerAge=2
  #&apikey=7p76BRYgNg4U4Map8Gad5p2mjcxBikEv

  def self.findFlight departureAirport, arrivalAirport, departureDate
    @query["departureAirport"] = departureAirport
    @query["arrivalAirport"] = arrivalAirport
    @query["departureDate"] = departureDate
    get("/mflights/search", :query => @query)
  end

  def self.findCheapestFlight departureAirport, arrivalAirport, departureDate
  	res = findFlight(departureAirport, arrivalAirport, departureDate).parsed_response
  	arr = []
  	res["offers"].each do |o|
  		arr << o["totalFare"].to_f
  	end
  	return arr.min
  end
end