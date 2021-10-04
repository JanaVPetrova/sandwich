# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient_group do
    recipe
    title { Faker::Food.dish }
  end
end
