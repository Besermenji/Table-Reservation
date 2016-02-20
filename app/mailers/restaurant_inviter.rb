class RestaurantInviter < ApplicationMailer
  def invite(rating_id, invited_user_id, inviter_user_id)
    @rating = Rating.find(rating_id)
    @invited_user = User.find(invited_user_id)
    @inviter_user = User.find(inviter_user_id) 
    @restaurant = Restaurant.find(@rating.visited_id)
    @invite = Invitation.create(rating_id: rating_id,
		  invited_user_id: invited_user_id)
    mail(from: 'invites@tablereservations.com',
	 to: @invited_user.email,
	 subject: @inviter_user.full_name << ' has invited you to a restaurant!')
  end
end
