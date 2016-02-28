
json.array!(@destinations) do |d|
	json.extract! d, :id, :name, :city, :state, :country, :description, :tags
end