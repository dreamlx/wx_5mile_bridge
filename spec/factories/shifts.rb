FactoryGirl.define do
  factory :shift do
    association :doctor
    date "2015-11-13"
    from_time "2015-11-13 14:23:31"
    to_time "2015-11-13 14:23:31"
    category "MyString"
    shift_type "MyString"
  end

end
