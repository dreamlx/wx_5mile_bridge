require 'rails_helper'

RSpec.describe "advices" do
  describe "GET show" do
    it "get the requested advice" do
      advice = create(:advice)
      get "/api/advices/#{advice.id}"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)["advice"]
      expect(json["id"]).to eq advice.id
      expect(json["title"]).to eq advice.title
      expect(json["img"]["img"]["url"]).to eq advice.img.url
      expect(json["content"]).to eq advice.content
      expect(json["video_url"]).to eq advice.video_url
      expect(json["created_at"].to_datetime.to_s(:db)).to eq advice.created_at.to_datetime.to_s(:db)
      expect(json["updated_at"].to_datetime.to_s(:db)).to eq advice.updated_at.to_datetime.to_s(:db)
    end
  end

  describe "GET index" do
    it "get all published advice" do
      advice = create(:advice, state: "发布")
      get "/api/advices"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)["advices"].first
      expect(json["id"]).to eq advice.id
    end
  end
end