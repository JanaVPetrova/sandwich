# frozen_string_literal: true

module Profile
  module Recipes
    class ApplicationController < Profile::ApplicationController
      helper_method :current_recipe

      def current_recipe
        @current_recipe ||= current_user.recipes.find_by!(slug: params[:recipe_slug])
      end
    end
  end
end
