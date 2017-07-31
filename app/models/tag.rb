class Tag < ApplicationRecord
  belongs_to :category
  belongs_to :thought

end
