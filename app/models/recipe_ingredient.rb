# frozen_string_literal: true

class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient_group
  belongs_to :ingredient, optional: true
  has_one :recipe, through: :ingredient_group

  validates :quantity, presence: true
  validates :unit, presence: true

  before_validation :set_defaults

  def ingredient_title
    title.presence || ingredient&.title.presence
  end

  def metric_quantity
    @metric_quantity ||= Unit.new(quantity, unit).convert_to_metric.humanize
  end

  def imperial_quantity
    @imperial_quantity ||= Unit.new(quantity, unit).convert_to_imperial.humanize
  end

  def weight_g
    @weight_g ||= begin
      conversion_map = if Unit::TRIVIAL_UNITS.include?(unit) && unit_g.present?
        { unit.to_sym => unit_g }
      else
        {}
      end

      Unit.new(quantity, unit, conversion_map).convert_to_grams.quantity
    end
  rescue Unit::ConversionError
    nil
  end

  def nutrition_fact
    return unless weight_g
    return unless protein_g && fat_g && carbohydrates_g

    @nutrition_fact ||= NutritionFact.new(protein_g, fat_g, carbohydrates_g).scale(weight_g)
  end

  private

  def set_defaults
    self.quantity ||= 0
    self.unit ||= 'g'
  end
end
