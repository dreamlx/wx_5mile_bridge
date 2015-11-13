FactoryGirl.define do
  factory :exam do
    association :user
    name "MyString"
    id_no "MyString"
    gender "MyString"
    address "MyString"
    age 1
    card_no "MyString"
    cell "MyString"
    chronic_diseases "MyString"
  end

end
