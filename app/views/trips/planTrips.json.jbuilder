json.array!(@ret_trips) do |trip|
	json.trip do
	  json.hotel_price trip.hotel_price

	  json.departure do 
  		json.depart_price trip["depart_price"]
  		json.departure_airport_leave trip.departure_airport_leave
  		json.arrival_airport_leave trip.arrival_airport_leave
 	 end

  	  json.return do 
  		json.return_price trip["return_price"]
  		json.departure_airport_back trip.departure_airport_back
  		json.arrival_airport_back trip.arrival_airport_back
  	  end
	  json.date_start trip["date_start"]
	  json.date_end trip["date_end"]
	  json.destination do 
	  	json.id trip.destination.id
	    json.city trip.destination.city
	    json.state trip.destination.state
	    json.country trip.destination.country
	    json.tags do |tag|
	      json.array! (trip.destination.tags)
	    end
	    json.description trip.destination.description
	  end
	end
end