# frozen_string_literal: true

module Profile
  class HomeController < ApplicationController
    def index
      @recipes = current_user.recipes
    end
  end
end
