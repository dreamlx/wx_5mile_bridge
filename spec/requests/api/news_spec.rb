require 'rails_helper'

RSpec.describe "news" do
  describe "GET show" do
    it "get the requested news" do
      news = create(:news)
      get "/api/news/#{news.id}"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)["news"]
      expect(json["id"]).to eq news.id
      expect(json["title"]).to eq news.title
      expect(json["img"]["img"]["url"]).to eq news.img.url
      expect(json["content"]).to eq news.content
      expect(json["video_url"]).to eq news.video_url
      expect(json["created_at"].to_datetime.to_s(:db)).to eq news.created_at.to_datetime.to_s(:db)
      expect(json["updated_at"].to_datetime.to_s(:db)).to eq news.updated_at.to_datetime.to_s(:db)
    end
  end

  describe "GET index" do
    it "get all published news" do
      news = create(:news, state: "发布")
      get "/api/news"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)["news"].first
      expect(json["id"]).to eq news.id
    end
  end
end