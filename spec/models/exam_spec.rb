require 'rails_helper'

RSpec.describe Exam, type: :model do
  it "is valid" do
    expect(create(:exam)).to be_valid
  end
end
