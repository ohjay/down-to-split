json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :date_purchased, :cost, :product_id, :shopping_trip_id
  json.url purchase_url(purchase, format: :json)
end
