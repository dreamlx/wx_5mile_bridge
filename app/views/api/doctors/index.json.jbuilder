json.doctors do
  json.partial! 'api/doctors/doctor', collection: @doctors, as: :doctor
end