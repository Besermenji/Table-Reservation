class Table < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  belongs_to :restaurant
  has_many :bookings
end
