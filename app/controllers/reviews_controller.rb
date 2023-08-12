class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[index new create]
  before_action :set_review, only: %i[destroy]

  def index

  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to @restaurant
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy

    redirect_to @review.restaurant
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
