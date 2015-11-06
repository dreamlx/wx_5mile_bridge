require 'rails_helper'

RSpec.describe News, type: :model do
  it "is valid" do
    expect(create(:news)).to be_valid
  end
end
