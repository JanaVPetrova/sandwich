# frozen_string_literal: true

module Recipes
  class Create
    include Interactor

    delegate :user, :recipe_params, to: :context
    delegate :recipe, to: :context

    def call
      context.recipe = user.recipes.new(recipe_params)

      if recipe.valid?
        ActiveRecord::Base.transaction do
          recipe.save!
          recipe.ingredient_groups.create!
        end
      else
        context.fail!
      end
    end
  end
end
