require 'rails_helper'

RSpec.describe "appointments" do
  describe "POST create" do
    it "create a new appointment" do
      user = create(:user)
      valid_header  = {
        authorization: ActionController::HttpAuthentication::Token.encode_credentials("#{user.authentication_token},cell=#{user.cell}")
      }
      doctor = create(:doctor)
      valid_attributes = attributes_for(:appointment).merge(doctor_id: doctor.id)
      post "/api/appointments", {appointment: valid_attributes}, valid_header
      expect(response).to be_success
      expect(response).to have_http_status(201)
      json = JSON.parse(response.body)["appointment"]
      expect(json["id"]).not_to be_nil
      expect(json["user_id"]).to eq user.id
      expect(json["doctor_id"]).to eq doctor.id
      expect(json["booking_time"].to_datetime.to_s(:db)).to eq valid_attributes[:booking_time].to_datetime.to_s(:db)
      expect(json["state"]).to eq "提交成功"
    end
  end
end