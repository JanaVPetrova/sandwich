class AddWeightInGToRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    change_table :recipe_ingredients do |t|
      t.decimal "carbohydrates_g"
      t.decimal "fat_g"
      t.decimal "protein_g"
      t.decimal "unit_g"
    end

    RecipeIngredient.update_all('carbohydrates_g = (carbohydrates_mg / 1000)')
    RecipeIngredient.update_all('fat_g = (fat_mg / 1000)')
    RecipeIngredient.update_all('protein_g = (protein_mg / 1000)')
    RecipeIngredient.update_all('unit_g = (unit_mg / 1000)')
  end
end
