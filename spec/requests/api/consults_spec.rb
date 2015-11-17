require 'rails_helper'

RSpec.describe "consults" do

  describe "GET index" do
    it "get all consults" do
      user = create(:user)
      valid_header  = {
        authorization: ActionController::HttpAuthentication::Token.encode_credentials("#{user.authentication_token},cell=#{user.cell}")
      }
      woman = create(:consult, department: '妇女保健')
      child = create(:consult, department: '儿童保健')
      immune = create(:consult, department: '计划免疫')
      get "/api/consults",{}, valid_header
      expect(response).to be_success
      expect(response).to have_http_status(200)
      children_json = JSON.parse(response.body)["children"].first
      expect(children_json["id"]).to eq child.id
      expect(children_json["title"]).to eq child.title
      expect(children_json["department"]).to eq child.department
      expect(children_json["content"]).to eq child.content
      expect(children_json["submit_at"].to_datetime.to_s(:db)).to eq child.submit_at.to_datetime.to_s(:db)
      expect(children_json["user_name"]).to eq user.name
      expect(JSON.parse(response.body)["women"].count).to eq 1
      expect(JSON.parse(response.body)["immunes"].count).to eq 1
    end
  end

  describe "POST create" do
    it "create a new consult" do
      user = create(:user)
      valid_header  = {
        authorization: ActionController::HttpAuthentication::Token.encode_credentials("#{user.authentication_token},cell=#{user.cell}")
      }
      valid_attributes = attributes_for(:consult)
      post "/api/consults",{consult: valid_attributes}, valid_header
      expect(response).to be_success
      expect(response).to have_http_status(201)
      json = JSON.parse(response.body)["consult"]
      expect(json["id"]).not_to be_nil
      expect(json["title"]).to eq valid_attributes[:title]
      expect(json["department"]).to eq valid_attributes[:department]
      expect(json["submit_at"]).not_to be_nil
      expect(json["user_id"]).to eq user.id
    end
  end
end