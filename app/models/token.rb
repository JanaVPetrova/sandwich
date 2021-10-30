# frozen_string_literal: true

class Token < ApplicationRecord
  PASSWORD_RECOVERY_KIND = 'password_recovery'

  belongs_to :user

  has_secure_token :value, length: 36

  scope :password_recovery, -> { where(kind: PASSWORD_RECOVERY_KIND) }
end
