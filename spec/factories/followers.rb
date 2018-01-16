FactoryBot.define do
  factory :follower do
    association :current, factory: :user
    association :follower, factory: :user
  end
end
