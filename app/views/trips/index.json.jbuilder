json.array!(@trips) do |trip|
  json.id trip.id
  json.hotel_price trip.hotel_price
  json.date_start trip["date_start"]
  json.date_end trip["date_end"]
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
end
