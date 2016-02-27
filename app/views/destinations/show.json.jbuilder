json.destination do |d|
  json.id @destination.id
  json.city @destination.city
  json.state @destination.state
  json.country @destination.country
  json.description @destination.description
end
