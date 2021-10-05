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

  private

  def generate_image_derivatives
    return if image_data.blank?

    image_derivatives!
  end
end
