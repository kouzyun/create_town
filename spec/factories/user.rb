FactoryGirl.define do
    factory :user do
        last_name "田中"
        first_name "太郎"
        sequence(:email) { |n| "tanaka#{n}@test.com"}
        password "password"
    password_confirmation "password"
    end
end