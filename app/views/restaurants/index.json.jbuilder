json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :description
  json.url restaurant_url(restaurant, format: :json)
end
