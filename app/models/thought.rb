class Thought < ApplicationRecord
  has_many :comments
  has_many :tags
  has_many :categories, through: :tags
  belongs_to :user
end
