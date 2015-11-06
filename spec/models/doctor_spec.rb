require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it "is valid" do
    expect(create(:doctor)).to be_valid
  end
end
