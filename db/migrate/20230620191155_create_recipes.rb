class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :cooking_time, null: false
      t.text :description, null: false
      t.text :ingredients, null: false
      t.text :preparation, null: false
      t.string :difficulty, null: false
      t.string :category, null: false

      t.timestamps
    end
    add_index :recipes, :name, unique: true
  end
end
