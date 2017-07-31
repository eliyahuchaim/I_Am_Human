class Category < ApplicationRecord
  has_many :tags
  has_many :thoughts, through: :tags
  
end
