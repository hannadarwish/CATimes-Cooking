# == Schema Information
#
# Table name: saved_recipes
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  recipe_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SavedRecipe < ApplicationRecord

    belongs_to :user
    belongs_to :recipe

    validates :user_id, presence: true
    validates :recipe_id, presence: true
    validates :recipe_id, uniqueness: { scope: :user_id } # prevents duplicate saved recipes for the same user and recipe

end
