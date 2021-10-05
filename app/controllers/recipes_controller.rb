# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(state: 'published').page(params[:page])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
