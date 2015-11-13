FactoryGirl.define do
  factory :appointment do
    association :user
    association :doctor
    booking_time "2015-11-12 18:45:56"
    cell "MyString"
    state "MyString"
  end

end
