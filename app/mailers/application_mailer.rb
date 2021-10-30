# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@sausage-sandwich.club'
  layout 'mailer'
end
