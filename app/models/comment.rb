class Comment < ApplicationRecord
  belongs_to :thought
  belongs_to :user
  
end
