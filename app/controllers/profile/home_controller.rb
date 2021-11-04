# frozen_string_literal: true

module Profile
  class HomeController < ApplicationController
    def index
      @recipes = current_user.recipes.page(params[:page]).per(16)
    end
  end
end
