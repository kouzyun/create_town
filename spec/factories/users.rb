FactoryBot.define do
  factory :user do
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    email { Faker::Internet.free_email }
    password { "testtest" }
    password_confirmation { "testtest" }
  end
end