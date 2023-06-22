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
#  category     :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  org_category :string
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

    has_one_attached :photo

    MEAL_CATEGORIES = ["Breakfast", "Brunch", "Lunch", "Dinner", "Sides", "Dessert"]

    validates :cooking_time, :description, :ingredients, :preparation, :meal_category, :image_url, presence: true
    validates :name, presence: true, uniqueness: true
    validates :meal_category, inclusion: { in: MEAL_CATEGORIES, message: "'%{value}' must be one of the following: Breakfast, Brunch, Lunch, Dinner, Sides, Dessert" }

end
