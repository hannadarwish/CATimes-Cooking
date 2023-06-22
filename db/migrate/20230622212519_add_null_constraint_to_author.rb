class AddNullConstraintToAuthor < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:recipes, :author, false)
  end
end
