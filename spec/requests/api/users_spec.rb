require 'rails_helper'

RSpec.describe "users" do
  describe "POST create" do
    it "create a new user" do
      doctor = create(:doctor)
      valid_attributes  = attributes_for(:user).merge(doctor_id: doctor.id)
      post "/api/users", {user: valid_attributes}
      expect(response).to be_success
      expect(response).to have_http_status(201)
      json = JSON.parse(response.body)["user"]
      expect(json["id"]).not_to be_nil
      expect(json["cell"]).to eq valid_attributes[:cell]
      expect(json["name"]).to eq valid_attributes[:name]
      expect(json["address"]).to eq valid_attributes[:address]
      expect(json["gender"]).to eq valid_attributes[:gender]
      expect(json["id_no"]).to eq valid_attributes[:id_no]
      expect(json["card_no"]).to eq valid_attributes[:card_no]
      expect(json["doctor_id"]).to eq doctor.id
      expect(json["token"]).not_to be_nil
    end
  end

  describe "GET show" do
    it "get the requested user" do
      user = create(:user)
      valid_header  = {
        authorization: ActionController::HttpAuthentication::Token.encode_credentials("#{user.authentication_token},cell=#{user.cell}")
      }
      get "/api/users/#{user.id}", {}, valid_header
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)["user"]
      expect(json["id"]).to eq user.id
      expect(json["cell"]).to eq user.cell
      expect(json["name"]).to eq user.name
      expect(json["address"]).to eq user.address
      expect(json["gender"]).to eq user.gender
      expect(json["id_no"]).to eq user.id_no
      expect(json["card_no"]).to eq user.card_no
      expect(json["doctor_id"]).to eq user.doctor_id
      expect(json["token"]).to eq user.authentication_token
    end
  end

  describe "GET doctors" do
    it "get doctors" do
      doctor = create(:doctor)
      another_doctor = create(:doctor)
      get "/api/users/doctors"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)["doctors"].first
      expect(json.first).to eq doctor.id
      expect(json.last).to eq doctor.name
      expect(JSON.parse(response.body)["doctors"].count).to eq 2
    end
  end
end