FactoryGirl.define do
  factory :post do
    content { Faker::StarWars.quote }
    association :user
  end
end
