class OrderedThoughtsController < ApplicationController

  def ordered_category_thoughts
    @category = Category.find(params[:id])
    ordered_thoughts = @category.score_thoughts
    render json: ordered_thoughts

  end



end
