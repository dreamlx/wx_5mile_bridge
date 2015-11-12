FactoryGirl.define do
  factory :consult do
    association :user
    title "MyString"
    department "妇女保健"
    content "MyText"
  end
end
