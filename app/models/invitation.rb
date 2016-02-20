class Invitation < ActiveRecord::Base
  before_create :generate_token

  belongs_to :rating
  belongs_to :invited_user, class_name: 'User'  

  private

  def generate_token
    unique = false
    while !unique 
      self.token = SecureRandom.urlsafe_base64(10)
      unique = true if Invitation.find_by_token(self.token).nil?
    end
  end
end
