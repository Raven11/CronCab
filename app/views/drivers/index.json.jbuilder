json.array!(@drivers) do |driver|
  json.extract! driver, :id, :name, :mobile, :license_no, :pan_no, :image_id, :status, :encrypted_password
  json.url driver_url(driver, format: :json)
end
