json.doctor do
  json.partial! 'api/doctors/doctor', doctor: @doctor
end