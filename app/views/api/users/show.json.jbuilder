json.user do
  json.(@user, :id, :cell, :name, :address, :gender, :id_no, :card_no, :doctor_id )
  json.token @user.authentication_token
end