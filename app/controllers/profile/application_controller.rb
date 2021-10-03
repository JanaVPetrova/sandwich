# frozen_string_literal: true

module Profile
  class ApplicationController < ApplicationController
    class UnauthorizedError < StandardError; end

    before_action :authenticate!

    rescue_from UnauthorizedError, with: :unauthorized

    def authenticate!
      raise UnauthorizedError unless current_user
    end

    def unauthorized
      head :not_found
    end
  end
end
