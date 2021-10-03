# frozen_string_literal: true

module Profile
  module Recipes
    module RecipeIngredientsHelper
      def units
        Unit::UNITS.index_by do |unit|
          I18n.t(unit, scope: :units, count: 0)
        end
      end
    end
  end
end
