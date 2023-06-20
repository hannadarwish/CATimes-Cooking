# == Schema Information
#
# Table name: notes
#
#  id            :bigint           not null, primary key
#  recipe_id     :bigint           not null
#  body          :text             not null
#  author_id     :bigint           not null
#  reviewer_name :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Note < ApplicationRecord
  belongs_to :recipe

  belongs_to :author,
  class_name: 'User',
  foreign_key: 'author_id'

  validates :recipe_id, :body, :author_id, :reviewer_name, presence: true

end
