FactoryGirl.define do
  factory :user do
    cell "MyString"
    name "MyString"
    address "MyText"
    gender "男"
    id_no "MyString"
    card_no "MyString"
    association :doctor
    password "foobar"
    password_confirmation "foobar"
  end

end
