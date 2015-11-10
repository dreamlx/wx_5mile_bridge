require 'rails_helper'

RSpec.describe Consult, type: :model do
  it "is valid" do
    expect(create(:consult)).to be_valid
  end
end
