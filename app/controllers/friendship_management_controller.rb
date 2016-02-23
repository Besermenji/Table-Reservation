class FriendshipManagementController < ApplicationController
  PAGE_NUM = 10.freeze

  def add_friends
    if params[:search]
      @users = User.search(params[:search]).where.not(id: (current_user.friends.map(&:id) << current_user.pending_friends.map(&:id) << current_user.id)).paginate(page: params[:page], per_page: PAGE_NUM)
    else
     @users = User.where.not(id: (current_user.friends.map(&:id) << current_user.pending_friends.map(&:id) << current_user.id)).paginate(page: params[:page], per_page: PAGE_NUM)

    end
    render '_table'
  end

  def add_to_friends
    user = User.find(params[:id])
    current_user.friend_request(user) 
    flash[:notice] = 'Friend request to ' << user.first_name << ' '<< user.last_name << ' sent!'
    redirect_to add_friends_path 
  end

  def manage_pending_friend_requests
    if params[:search]
      @users = current_user.search(params[:search]).requested_friends.paginate(page: params[:page], per_page: PAGE_NUM)
    else
      @users = current_user.requested_friends.paginate(page: params[:page], per_page: PAGE_NUM)
    end
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
    if params[:search]
      @users = current_user.search(params[:search]).friends.paginate(page: params[:page], per_page: PAGE_NUM)
    else
      @users = current_user.friends.paginate(page: params[:page], per_page: PAGE_NUM)
    end
    render '_table'
  end

  def remove_from_friends
    user = User.find(params[:id])
    current_user.remove_friend(user)
    flash[:notice] = 'You have removed ' << user.first_name << ' ' << user.last_name << ' from your friends list!'
    redirect_to my_friends_path
  end
end
