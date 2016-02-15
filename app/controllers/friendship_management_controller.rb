class FriendshipManagementController < ApplicationController
	
  def add_friends
    @users = User.where.not(id: (current_user.friends.map(&:id) << current_user.pending_friends.map(&:id) << current_user.id))
    render '_table'
  end

  def add_to_friends
    user = User.find(params[:id])
    current_user.friend_request(user) 
    flash[:notice] = 'Friend request to ' << user.first_name << ' '<< user.last_name << ' sent!'
    redirect_to add_friends_path 
  end

  def manage_pending_friend_requests
    @users = current_user.requested_friends  
    render '_table'
  end

  def accept_friend_requests
    user = User.find(params[:id])
    current_user.accept_request(user)
    flash[:notice] = 'You have accepted friend request from ' << user.first_name << ' '<< user.last_name << '!'
    redirect_to manage_friend_requests_path
  end

  def decline_friend_requests
    user = User.find(params[:id])
    current_user.decline_request(user)
    flash[:notice] = 'You have declined frined request from' << user.first_name << ' ' << user.last_name << '!'
    redirect_to manage_friend_requests_path
  end

  def my_friends
    @users = current_user.friends
    render '_table'
  end

  def remove_from_friends
    user = User.find(params[:id])
    current_user.remove_friend(user)
    flash[:notice] = 'You have removed ' << user.first_name << ' ' << user.last_name << ' from your friends list!'
    redirect_to my_friends_path
  end
end
