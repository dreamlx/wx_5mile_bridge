require 'rails_helper'

RSpec.describe Advice, type: :model do
  it "is valid" do
    expect(create(:advice)).to be_valid
  end
end
