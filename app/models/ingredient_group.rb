# frozen_string_literal: true

class IngredientGroup < ApplicationRecord
  belongs_to :recipe
  has_many :recipe_ingredients, dependent: :restrict_with_exception
end
