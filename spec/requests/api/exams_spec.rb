require 'rails_helper'

RSpec.describe "exams" do
  describe "POST create" do
    it "create a new exam" do
      user = create(:user)
      valid_header  = {
        authorization: ActionController::HttpAuthentication::Token.encode_credentials("#{user.authentication_token},cell=#{user.cell}")
      }
      valid_attributes = attributes_for(:exam)
      post "/api/exams", {exam: valid_attributes}, valid_header
      expect(response).to be_success
      expect(response).to have_http_status(201)
      json = JSON.parse(response.body)["exam"]
      expect(json["id"]).not_to be_nil
      expect(json["name"]).to eq valid_attributes[:name]
      expect(json["id_no"]).to eq valid_attributes[:id_no]
      expect(json["gender"]).to eq valid_attributes[:gender]
      expect(json["address"]).to eq valid_attributes[:address]
      expect(json["age"]).to eq valid_attributes[:age]
      expect(json["card_no"]).to eq valid_attributes[:card_no]
      expect(json["cell"]).to eq valid_attributes[:cell]
      expect(json["chronic_diseases"]).to eq valid_attributes[:chronic_diseases]
      expect(json["created_at"]).not_to be_nil
    end
  end
end