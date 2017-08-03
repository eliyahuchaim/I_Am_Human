class Comment < ApplicationRecord
  belongs_to :thought
  belongs_to :user

  validates :content, presence: true

end
