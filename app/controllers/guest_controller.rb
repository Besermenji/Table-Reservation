class GuestController < ApplicationController
  def index
    @ratings = Rating.where(visitor_id: current_user.id)
    @restaurants = []
    @ratings.each do |rating|
      @restaurants << Restaurant.find(rating.visited_id)
    end
  end

  def rate_restaurant
    @rating = Rating.find(params[:id])
    @rating.rating = params[:rating].to_i
    @rating.save
    redirect_to guest_index_path
  end
end
