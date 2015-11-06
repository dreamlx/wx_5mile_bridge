require 'rails_helper'

RSpec.describe Hospital, type: :model do
  it "is valid" do
    expect(create(:hospital)).to be_valid
  end
end
