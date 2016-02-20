class GuestController < ApplicationController
  before_action :set_rating, only: [:rate_restaurant, :invite_friends, :send_invite]
  before_action :set_invite, only: [:invite_accepted, :invite_declined]
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
    RestaurantInviter.invite(@rating.id, params[:user_id],current_user.id).deliver_now  
    flash[:notice] = User.find(params[:user_id]).full_name << ' is invited!'
    redirect_to invite_friends_path(@rating.id)
  end

  def accept_invite
    if @invite = Invitation.find_by(token: params[:token],
		                     invited_user_id: current_user.id)
      if @invite.accepted.nil?
        @rating = Rating.find(@invite.rating_id)
        @restaurant = Restaurant.find(@rating.visited_id)
        @inviter = User.find(@rating.visitor_id)
      else
	redirect_to root_path 
      end
    else
      redirect_to root_path
    end
  end

  def invite_accepted
    @invite.accepted = true
    @invite.save
    rating = Rating.find(@invite.rating_id)
    Rating.create(visited_date: rating.visited_date,
		  visitor_id: current_user.id,
		  visited_id: rating.visited_id)
    redirect_to root_path
  end
  
  def invite_declined
    @invite.accepted = false
    @invite.save
    redirect_to root_path
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def set_invite
    @invite = Invitation.find_by(token: params[:token])
  end
end
