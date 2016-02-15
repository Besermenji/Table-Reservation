class GuestController < ApplicationController
  before_action :set_rating, only: [:rate_restaurant, :invite_friends]

  def index
    @ratings = Rating.where(visitor_id: current_user.id)
    @restaurants = []
    @ratings.each do |rating|
      @restaurants << Restaurant.find(rating.visited_id)
    end
  end

  def rate_restaurant
    @rating.rating = params[:rating].to_i
    @rating.save
    redirect_to guest_index_path
  end

  def invite_friends
    @friends = [] 
    current_user.friends.find_each do |f|
      next if Rating.find_by(visitor_id: f.id, visited_date: @rating.visited_date)	 
      @friends << f
    end 
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end
end
