require 'rails_helper'

RSpec.describe Shift, type: :model do
  it "is valid" do
    expect(create(:shift)).to be_valid
  end
end
