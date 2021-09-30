FactoryBot.define do
  factory :recipe do
    user
    title { Faker::Food.dish }
    body { Faker::Food.description }
  end
end
