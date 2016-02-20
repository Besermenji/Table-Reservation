class Rating < ActiveRecord::Base
  belongs_to :visitor, class_name: 'User'
  belongs_to :visited, class_name: 'Booking'
  has_many :invitations
end
