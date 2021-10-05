class AddDescriptionAndSecretColumnsToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :description, :text
    add_column :recipes, :secret, :boolean, default: false
  end
end
