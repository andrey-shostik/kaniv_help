require 'faker'

FactoryGirl.define do
  factory :user do
    first_name    { Faker::Name.name }
    last_name     { Faker::Name.name }
    surname       { Faker::Name.name }
    email         { Faker::Internet.email }
    password      { Faker::Internet.password }
  end
end
