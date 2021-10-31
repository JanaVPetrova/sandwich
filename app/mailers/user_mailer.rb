# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def reset_password(token)
    @token = token

    mail(
      subject: I18n.t('user_mailer.reset_password.subject'),
      to: token.user.email
    )
  end
end
