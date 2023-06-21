# == Schema Information
#
# Table name: recipes
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  cooking_time :string           not null
#  description  :text             not null
#  ingredients  :text             not null
#  preparation  :text             not null
#  difficulty   :string           not null
#  category     :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Recipe < ApplicationRecord
    has_many :notes,
    dependent: :destroy

    has_many :saved_recipes, # a recipe can be saved by multiple users
    dependent: :destroy

    has_many :users,
    through: :saved_recipes

    has_many :ratings,
    dependent: :destroy

    CATEGORIES = ["Breakfast", "Brunch", "Lunch", "Dinner", "Sides", "Dessert"]

    validates :cooking_time, :description, :ingredients, :preparation, :category, presence: true
    validates :name, presence: true, uniqueness: true
    validates :category, inclusion: { in: CATEGORIES, message: "'%{value}' must be one of the following: Breakfast, Brunch, Lunch, Dinner, Sides, Dessert" }



end
