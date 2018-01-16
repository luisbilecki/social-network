FactoryBot.define do
  factory :comment do
    content { Faker::StarWars.quote }
    user
    post
  end
end
