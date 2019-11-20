class CommentsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    # we need `restaurant_id` to associate comment with corresponding restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment.restaurant = @restaurant
    @comments = @restaurant.comments
    
    if @comment.save
      redirect_to restaurant_path(@restaurant)
    else
      render "restaurants/show"
    end    
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end