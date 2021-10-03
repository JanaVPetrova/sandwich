# frozen_string_literal: true

module Profile
  module Recipes
    module IngredientGroups
      class ApplicationController < Profile::Recipes::ApplicationController
        helper_method :current_ingredient_group

        def current_ingredient_group
          @current_ingredient_group ||= current_recipe.ingredient_groups.find(params[:ingredient_group_id])
        end
      end
    end
  end
end
