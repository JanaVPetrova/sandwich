module Profile::Recipes::RecipeIngredientsHelper
  def units
    Unit::UNITS.each_with_object({}) do |unit, memo|
      memo[I18n.t(unit, scope: :units, count: 0)] = unit
    end
  end
end
