json.trip do |t|
  json.id @trip.id
  json.departure_airport @trip.departure_airport
  json.hotel_prices @trip.hotel_prices
  json.depart_price @trip.depart_price
  json.return_price @trip.return_price
  json.date_start toDate(@trip.date_start)
  json.date_end toDate(@trip.date_end)
  json.destination do |d|
  	json.id @destination.id
    json.city @destination.city
    json.state @destination.state
    json.country @destination.country
    json.tags do |t|
      json.array! (@destination.tags)
    end
    json.description @destination.description
  end
end