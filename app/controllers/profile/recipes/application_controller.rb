class Profile::Recipes::ApplicationController < Profile::ApplicationController
  helper_method :current_recipe

  def current_recipe
    @current_recipe ||= current_user.recipes.find(params[:recipe_id])
  end
end
