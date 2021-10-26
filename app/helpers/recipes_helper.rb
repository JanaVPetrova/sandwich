# frozen_string_literal: true

module RecipesHelper
  def can_edit_recipe?(recipe, user)
    recipe.user_id == user&.id
  end
end
