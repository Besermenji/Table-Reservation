class GuestController < ApplicationController
  before_action :set_rating, only: [:rate_restaurant, :invite_friends, :send_invite]

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
    next if Invitation.find_by(invited_user_id: f.id,
			       rating_id: @rating.id)	 
    @friends << f
    end 
  end

  def send_invite
    RestaurantInviter.invite(@rating.id,params[:id],current_user.id).deliver_now  
    flash[:notice] = User.find(params[:id]).full_name << ' is invited!'
    redirect_to invite_friends_path(@rating)
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end
end
