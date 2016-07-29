json.array!(@shopping_trips) do |shopping_trip|
  json.extract! shopping_trip, :id, :name, :vendor_id, :user_id, :total, :date
  json.url shopping_trip_url(shopping_trip, format: :json)
end
