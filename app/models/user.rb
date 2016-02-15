class User < ActiveRecord::Base
  rolify
  has_friendship
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  validates :first_name, :last_name, :adress, presence: true
  
  has_many :restaurants
  has_many :bookings
  has_many :ratings, foreign_key: 'visitor_id'
  has_many :visited, class_name: 'Restaurant', foreign_key: 'visited_id', through: :ratings	
end
