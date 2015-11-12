FactoryGirl.define do
  factory :advice do
    title "MyString"
    img File.open(File.join(Rails.root, 'spec/fixtures/rails.png'))
    content "MyText"
    video_url "MyString"
    advice_type "儿保"
    state "发布"
  end

end
