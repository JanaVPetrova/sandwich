FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    body { Faker::Food.description }
  end
end
