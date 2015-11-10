FactoryGirl.define do
  factory :news do
    title "MyString"
    img File.open(File.join(Rails.root, 'spec/fixtures/rails.png'))
    content "MyText"
    video_url "MyString"
    state "发布"
  end
end
