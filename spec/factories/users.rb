include RandomData

FactoryBot.define do
  factory :user do
    # email  RandomData.random_email
    # password "password"
    # password_confirmation "password"
    # confirmed_at Date.today
    email Faker::Internet.free_email
    password 'password'
    password_confirmation 'password'
    confirmed_at Date.today    
  end
end
