class ExpediaWS
  include HTTParty

  base_uri 'http://terminal2.expedia.com/x'
  default_params :output => 'json'
  format :json

  def self.searchHotelwithNL(city)
    query = base_query
    query["q"] = "cheap+hotel+near+" + city
    hotel_array = get("/nlp/results", :query => query).parsed_response["result"]["hotels"]
    hotel_ids = []

    hotel_array.each do |h|
      hotel_ids << h["id"]
    end

    return hotel_ids
  end

  def self.searchCheapestHotels(city, date_in, date_out)
    query = base_query
    query["dates"] = date_in + "," + date_out
    query["adults"] = 1
    price_arr = []
    hotel = []
    hotel_ids = searchHotelwithNL(city)
    hotel_ids.each do |id|
      q = query
      q["hotelids"] = id
      res = get("/hotels", :query => q).parsed_response
      p res
      next if res["MatchingHotelCount"] != 0
      hotel_info = res["HotelInfoList"]["HotelInfo"]
      hotel << hotel_info
      if hotel_info["StatusCode"] == "0"
        price_arr << hotel_info["Price"]["TotalRate"]["Value"].to_f
      end
    end

    p price_arr

    if price_arr.size == 0
      return nil
    end

    index = price_arr.each.with_index.map{ |a, i| (a == price_arr.min) ? i : nil }.compact.first
    best_hotel = hotel[index]
    location = best_hotel["Location"]
    address = location.slice("StreetAddress", "City", "Province", "Country").values.join(", ")
    return {hotel_name: best_hotel["Name"], hotel_price: price_arr.min,
            StarRating: best_hotel["StarRating"], GuestRating: best_hotel["GuestRating"],
            hotel_address: address}
  end

  def self.findCheapestFlight departureAirport, arrivalAirport, departureDate
    query = base_query
    query["departureAirport"] = departureAirport
    query["arrivalAirport"] = arrivalAirport
    query["departureDate"] = departureDate
    res = get("/mflights/search", :query => query).parsed_response
    arr = []
    p departureAirport
    p arrivalAirport
    p departureDate
    #handle error
    if res["errors"]
      return nil
    end

    res["offers"].each do |o|
      arr << o["totalFare"].to_f
    end
    return arr.min
  end

  def self.findCheapestFlightToDest departureAirport, destination, departureDate
    ret_prices = [];
    destination.airports.each do |arrivalAirport|
    	p = findCheapestFlight(departureAirport, arrivalAirport, departureDate)
      if p
        ret_prices << p
      end
    end

    if ret_prices.size == 0
      return nil
    end

    index = ret_prices.each.with_index.map{ |a, i| (a == ret_prices.min) ? i : nil }.compact.first

    return {airport: destination.airports[index], price: ret_prices[index]}
  end

  def self.findCheapestFlightFromDest destination, arrivalAirport, departureDate
    ret_prices = [];

    destination.airports.each do |departureAirport|

      p = findCheapestFlight(departureAirport, arrivalAirport, departureDate)
      if p
        ret_prices << p
      end
    end

    if ret_prices.size == 0
      return nil
    end

    index = ret_prices.each.with_index.map{ |a, i| (a == ret_prices.min) ? i : nil }.compact.first

    return {airport: destination.airports[index], price: ret_prices[index]}
  end

  def self.base_query
    {:apikey => "sVcntuJXzYXGrfEGnGJkzv53Cg7e5Am9"}
  end
end