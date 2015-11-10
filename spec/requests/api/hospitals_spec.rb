require 'rails_helper'

RSpec.describe "hospitals" do
  describe "GET current" do
    it "get current hospital info: if no publish one, then get the first one" do
      hospital = create(:hospital, state: '保存')
      get "/api/hospitals/current"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)["hospital"]
      expect(json["id"]).to eq hospital.id
      expect(json["title"]).to eq hospital.title
      expect(json["img"]).to eq hospital.img
      expect(json["content"]).to eq hospital.content
      expect(json["video_url"]).to eq hospital.video_url
    end

    it "get current hospital info: first publish one" do
      saved_hospital = create(:hospital, state: '保存')
      hospital = create(:hospital, state: '发布')
      get "/api/hospitals/current"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)["hospital"]
      expect(json["id"]).to eq hospital.id
      expect(json["title"]).to eq hospital.title
      expect(json["img"]).to eq hospital.img
      expect(json["content"]).to eq hospital.content
      expect(json["video_url"]).to eq hospital.video_url
    end
  end
end