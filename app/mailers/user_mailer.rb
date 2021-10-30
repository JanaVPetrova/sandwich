# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def reset_password(token)
    @token = token
  end
end
