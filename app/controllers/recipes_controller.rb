# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.page(params[:page])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
