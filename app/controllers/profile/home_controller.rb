class Profile::HomeController < ApplicationController
  def index
    @recipes = current_user.recipes.page(params[:page])
  end
end
