class Category < ApplicationRecord
  has_many :tags
  has_many :thoughts, through: :tags

  def score_thoughts
    # self.thoughts.each do |thought|
    #   self.score = self.likes / self.views
    # end
    # self.thoughts.sort_by(&:score)
    self.thoughts.sort do |a, b|
      case
      when a["likes"].to_f / a["views"].to_f < b["likes"].to_f / b["views"].to_f
        1
      when a["likes"].to_f / a["views"].to_f > b["likes"].to_f / b["views"].to_f
        -1
      else
        0
      end
    end

  end

end
