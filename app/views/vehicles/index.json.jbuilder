json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :make, :model, :year, :registration_no, :driver_id, :driver_id
  json.url vehicle_url(vehicle, format: :json)
end
