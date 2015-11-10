require 'rails_helper'

RSpec.describe "doctors" do
  describe "GET index" do
    it "get all doctors" do
      doctor = create(:doctor)
      get "/api/doctors"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)["doctors"].first
      expect(json).to eq ""
      expect(json["id"]).to eq doctor.id
      expect(json["name"]).to eq doctor.name
      expect(json["grade"]).to eq doctor.grade
      expect(json["avatar"]["avatar"]["url"]).to eq doctor.avatar.url
      expect(json["desc"]).to eq doctor.desc
      expect(json["hospital"]).to eq doctor.hospital
      expect(json["department"]).to eq doctor.department
      expect(json["state"]).to eq doctor.state
    end
  end

  describe "GET show" do
    it "get the requested doctor" do
      doctor = create(:doctor)
      get "/api/doctors/#{doctor.id}"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)["doctor"]
      expect(json["id"]).to eq doctor.id
    end
  end
end