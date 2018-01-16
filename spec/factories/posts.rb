FactoryBot.define do
  factory :post do
    content { Faker::StarWars.quote }
    user
  end
end
