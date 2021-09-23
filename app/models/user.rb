class User < ApplicationRecord
  has_many :recipes

  before_save :downcase_email

  has_secure_password

  validates :name, presence: true, length: { minimum: 4, maximum: 30 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  def downcase_email
    self.email = email.downcase
  end
end
