# frozen_string_literal: true

module Profile
  module Recipes
    class NutritionFactsController < Profile::Recipes::ApplicationController
      def index; end

      def edit
        @recipe_ingredient = current_recipe.recipe_ingredients.find(params[:id])
      end

      def update
        @recipe_ingredient = current_recipe.recipe_ingredients.find(params[:id])
        @recipe_ingredient.update(recipe_ingredient_params)

        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace(
              "edit_recipe_ingredient_#{@recipe_ingredient.id}",
              partial: 'profile/recipes/nutrition_facts/recipe_ingredient_row',
              locals: { recipe_ingredient: @recipe_ingredient }
            )
          end
        end
      end

      private

      def recipe_ingredient_params
        params.require(:recipe_ingredient).permit(:protein_g, :fat_g, :carbohydrates_g)
      end
    end
  end
end
