class AddStateColumnToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :state, :string, null: false, default: 'draft'
  end
end
