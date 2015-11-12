require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it "is valid" do
    expect(create(:appointment)).to be_valid
  end
end
