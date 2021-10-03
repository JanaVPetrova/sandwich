# frozen_string_literal: true

class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient_group
  belongs_to :ingredient, optional: true
  belongs_to :recipe

  validates :quantity, presence: true
  validates :unit, presence: true

  def ingredient_title
    title.presence || ingredient&.title.presence
  end

  def metric_quantity
    @metric_quantity ||= Unit.new(quantity, unit).convert_to_metric.humanize
  end

  def imperial_quantity
    @imperial_quantity ||= Unit.new(quantity, unit).convert_to_imperial.humanize
  end
end
