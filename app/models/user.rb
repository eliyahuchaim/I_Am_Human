class User < ApplicationRecord
  has_many :thoughts
  has_many :comments
  # very accurate
  validates :username, uniqueness: true

end
