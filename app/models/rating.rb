# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  recipe_id  :bigint           not null
#  rating     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Rating < ApplicationRecord

    belongs_to :user
    belongs_to :recipe

    validates :user_id, presence: true
    validates :recipe_id, presence: true
    validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
    validates :user_id, uniqueness: { scope: :recipe_id } # a user can only have one rating per recipe


end
