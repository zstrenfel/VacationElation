class ExpediaWS
  include HTTParty

  base_uri 'http://terminal2.expedia.com/x'
  default_params :output => 'json'
  format :json

  @query = {:apikey => "7p76BRYgNg4U4Map8Gad5p2mjcxBikEv"}

  #http://terminal2.expedia.com/x/mflights
  #/search?departureAirport=LAX&arrivalAirport=ORD&departureDate=2016-04-22&childTravelerAge=2
  #&apikey=7p76BRYgNg4U4Map8Gad5p2mjcxBikEv

  def self.findCheapestFlight departureAirport, arrivalAirport, departureDate
    @query["departureAirport"] = departureAirport
    @query["arrivalAirport"] = arrivalAirport
    @query["departureDate"] = departureDate
    res = get("/mflights/search", :query => @query).parsed_response
    arr = []
    p departureAirport
    p arrivalAirport
    p departureDate
    p res
    res["offers"].each do |o|
      arr << o["totalFare"].to_f
    end
    arr.min
  end

  def self.findCheapestFlightToDest departureAirport, destination, departureDate
    ret_prices = [];
    destination.airports.each do |arrivalAirport|
    	ret_prices << findCheapestFlight(departureAirport, arrivalAirport, departureDate)
    end

    index = ret_prices.each.with_index.map{ |a, i| (a == ret_prices.min) ? i : nil }.compact.first

    return {airport: destination.airports[index], price: ret_prices[index]}
  end

  def self.findCheapestFlightFromDest destination, arrivalAirport, departureDate
    ret_prices = [];

    destination.airports.each do |departureAirport|

      ret_prices << findCheapestFlight(departureAirport, arrivalAirport, departureDate)
    end

    index = ret_prices.each.with_index.map{ |a, i| (a == ret_prices.min) ? i : nil }.compact.first

    return {airport: destination.airports[index], price: ret_prices[index]}
  end
end