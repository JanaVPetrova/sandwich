class Profile::RecipesController < Profile::ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to profile_recipe_recipe_ingredients_path(@recipe)
    else
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
