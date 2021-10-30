# frozen_string_literal: true

module Users
  class ResetPassword
    include Interactor

    delegate :token, :password, :password_confirmation, to: :context

    def call
      ActiveRecord::Base.transaction do
        token.user.update!(password: password, password_confirmation: password_confirmation)
        token.destroy!
      end
    end
  end
end
