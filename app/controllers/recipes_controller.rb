# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.for_public.page(params[:page]).per(16)
  end

  def show
    @recipe = Recipe.find_by!(slug: params[:slug])
  end
end
