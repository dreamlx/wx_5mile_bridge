json.appointment do
  json.(@appointment, :id, :user_id, :doctor_id, :booking_time, :cell, :state)
end