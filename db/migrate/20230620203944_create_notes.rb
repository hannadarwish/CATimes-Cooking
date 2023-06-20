class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.references :recipe, null: false, foreign_key: true
      t.text :body, null: false
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :reviewer_name, null: false

      t.timestamps
    end
  end
end
