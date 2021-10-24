# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(state: 'published').page(params[:page]).per(20)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
