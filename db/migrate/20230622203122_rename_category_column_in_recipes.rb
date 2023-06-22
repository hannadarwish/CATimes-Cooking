class RenameCategoryColumnInRecipes < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :category, :meal_category
  end
end
