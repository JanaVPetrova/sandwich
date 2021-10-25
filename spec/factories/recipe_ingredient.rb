# frozen_string_literal: true

FactoryBot.define do
  factory :recipe_ingredient do
    ingredient_group
    carbohydrates_g { Faker::Number.between(from: 1, to: 10) }
    fat_g { Faker::Number.between(from: 1, to: 10) }
    protein_g { Faker::Number.between(from: 1, to: 10) }
    quantity { Faker::Number.between(from: 100, to: 1000) }
    unit { 'g' }
  end
end
