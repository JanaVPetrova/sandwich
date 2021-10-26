# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.for_public.page(params[:page]).per(20)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
