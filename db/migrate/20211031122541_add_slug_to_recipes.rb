class AddSlugToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :slug, :string
    add_index :recipes, :slug, unique: true

    Recipe.find_each do |recipe|
      recipe.update!(
        slug: [recipe.id, I18n.transliterate(recipe.title).downcase.gsub(' ', '-')].join('-')
      )
    end

    change_column_null :recipes, :slug, false
  end
end
