class Category < ApplicationRecord
  has_many :tags
  has_many :thoughts, through: :tags

  validates :name, uniqueness: true
  validates :image_url, presence: true

end
