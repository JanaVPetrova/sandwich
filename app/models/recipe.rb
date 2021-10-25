# frozen_string_literal: true

class Recipe < ApplicationRecord
  include ImageUploader::Attachment(:image)
  include AASM

  belongs_to :user
  has_many :ingredient_groups, dependent: :destroy
  has_many :recipe_ingredients, through: :ingredient_groups
  has_many :ingredients, through: :recipe_ingredients

  validates :title, presence: true
  validates :body, presence: true

  after_create :generate_image_derivatives

  aasm column: :state do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end

    event :to_draft do
      transitions from: :published, to: :draft
    end
  end

  def nutrition_fact
    return if recipe_ingredients.blank?
    return unless can_calculate_nutrition_fact?

    @nutrition_fact ||= begin
      total_weight_g = recipe_ingredients.sum(&:weight_g)

      return if total_weight_g.zero?

      recipe_ingredients.sum(&:nutrition_fact).scale(BigDecimal('100') / total_weight_g)
    end
  end

  private

  def can_calculate_nutrition_fact?
    recipe_ingredients.detect { |recipe_ingredient| recipe_ingredient.nutrition_fact.blank? }.nil?
  end

  def generate_image_derivatives
    return if image_data.blank?

    image_derivatives!
  end
end
