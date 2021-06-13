class Profile::Recipes::RecipeIngredientsController < Profile::Recipes::ApplicationController
  def index
    @recipe_ingredient = current_recipe.recipe_ingredients.new
    @recipe_ingredients = current_recipe.recipe_ingredients.order(created_at: :desc)
  end

  def create
    ingredient_group = current_recipe.ingredient_groups.first_or_create!

    @recipe_ingredient = ingredient_group.recipe_ingredients.new(
      recipe_ingredient_params.merge(recipe_id: current_recipe.id)
    )

    if @recipe_ingredient.save
      @recipe_ingredient = current_recipe.recipe_ingredients.new
    end

    @recipe_ingredients = current_recipe.recipe_ingredients.order(created_at: :desc)

    render :index
  end

  private

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:title, :quantity, :unit)
  end
end
