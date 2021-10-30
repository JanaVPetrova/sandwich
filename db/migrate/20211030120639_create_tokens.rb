class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :value, null: false
      t.string :kind, null: false

      t.timestamps
    end

    add_index :tokens, :value, unique: true
  end
end
