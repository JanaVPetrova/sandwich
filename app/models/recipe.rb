class Recipe < ApplicationRecord
  has_many :ingredient_groups
  has_many :recipe_ingredients, through: :ingredient_groups
  has_many :ingredients, through: :recipe_ingredients

  validates :title, presence: true
  validates :body, presence: true

  def image_url(version = nil)
    version ? image_attacher.url(version.to_sym) : image_attacher.url
  end

  def image
    image_attacher.file
  end

  private

  def image_attacher
    ImageUploader::Attacher.from_model(self, :image)
  end
end
