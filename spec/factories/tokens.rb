# frozen_string_literal: true

FactoryBot.define do
  factory :token do
    user
    kind { Token::PASSWORD_RECOVERY_KIND }
  end
end
