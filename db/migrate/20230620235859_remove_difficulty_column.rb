class RemoveDifficultyColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :difficulty
  end
end
