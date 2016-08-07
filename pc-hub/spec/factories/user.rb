require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name { Faker::Name.name }
    f.country { Faker::Address.country }
    f.city { Faker::Address.city }
    f.email { Faker::Internet.email }
    f.password {Faker::Internet.password}
    f.role "staff"
  end
end
