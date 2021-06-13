class Profile::HomeController < ApplicationController
  def index
    @recipes = current_user.recipes
  end
end
