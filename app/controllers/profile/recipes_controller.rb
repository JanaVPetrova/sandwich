class Profile::RecipesController < Profile::ApplicationController
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
  end

  def update
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :image)
  end
end
