include RandomData

FactoryBot.define do
  factory :registered_application do
    # name RandomData.random_word
    # url RandomData.random_url
    name Faker::Lorem.word
    url Faker::Internet.url
  end
end
