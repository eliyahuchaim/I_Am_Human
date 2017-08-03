class Thought < ApplicationRecord
  has_many :comments
  has_many :tags
  has_many :categories, through: :tags
  belongs_to :user

  def tags=(params)
    params.map do |category|
      # tag_params = {category_id: category[:category_id]}
      self.tags << Tag.new(category)
    end
  end
end
