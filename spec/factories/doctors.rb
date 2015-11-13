FactoryGirl.define do
  factory :doctor do
    username {Faker::Name.name}
    name "MyString"
    grade "MyString"
    avatar File.open(File.join(Rails.root, 'spec/fixtures/rails.png'))
    desc "MyText"
    hospital "MyString"
    department "MyString"
    state "正常"
  end

end
