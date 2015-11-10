require 'rails_helper'

RSpec.describe "sessions" do
  describe "POST login" do
    it "login with cell and password" do
      user = create(:user)
      post "/api/sessions",{user: {cell: user.cell, password: user.password}}
      expect(response).to be_success
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)["user"]
      expect(json["id"]).to eq user.id
    end

    it "failed to login without user" do
      user = create(:user)
      post "/api/sessions",{cell: user.cell, password: user.password}
      expect(response).not_to be_success
      expect(response).to have_http_status(422)
    end
  end
end