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
