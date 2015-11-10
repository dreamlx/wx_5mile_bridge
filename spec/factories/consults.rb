FactoryGirl.define do
  factory :consult do
    association :user
    title "MyString"
    department "MyString"
    content "MyText"
  end
end
