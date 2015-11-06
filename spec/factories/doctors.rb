FactoryGirl.define do
  factory :doctor do
    username "MyString"
    name "MyString"
    grade "MyString"
    avatar File.open(File.join(Rails.root, 'spec/fixtures/rails.png'))
    desc "MyText"
    hospital "MyString"
    department "MyString"
    state "正常"
    password "foobar"
    password_confirmation "foobar"
  end

end
