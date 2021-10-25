# frozen_string_literal: true

module Profile
  class RecipesController < Profile::ApplicationController
    def new
      @recipe = Recipe.new
    end

    def create
      result = ::Recipes::Create.call(user: current_user, recipe_params: recipe_params)

      if result.success?
        redirect_to profile_recipe_ingredient_groups_path(result.recipe)
      else
        @recipe = result.recipe
        render :new
      end
    end

    def edit
      @recipe = Recipe.find(params[:id])
    end

    def edit_details
      @recipe = Recipe.find(params[:id])
    end

    def update
      @recipe = Recipe.find(params[:id])
      if @recipe.update(recipe_params.slice(:description, :secret))
        @recipe.publish! unless @recipe.published?

        redirect_to profile_recipe_path(@recipe)
      else
        render 'edit'
      end
    end

    def show
      @recipe = current_user.recipes.find(params[:id])
    end

    private

    def recipe_params
      params.require(:recipe).permit(:title, :body, :image, :description, :secret)
    end
  end
end
