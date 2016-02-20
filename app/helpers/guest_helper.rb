module GuestHelper
  def contains_invitation?(rating_id)
    current_user.invitations.find_by_rating_id(rating_id).nil?
  end
end
