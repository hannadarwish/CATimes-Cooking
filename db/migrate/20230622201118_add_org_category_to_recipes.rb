class AddOrgCategoryToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :org_category, :string
  end
end
