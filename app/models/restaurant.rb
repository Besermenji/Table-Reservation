class Restaurant < ActiveRecord::Base
  has_many :managers, class_name: 'User'
  has_many :meals, dependent: :destroy
  has_many :tables, dependent: :destroy
  has_many :ratings, foreign_key: 'visited_id'
  has_many :visitors, class_name: 'User', foreign_key: 'visitor_id', through: :ratings

  validates :name, presence: true

  self.locking_column = :lock_version

  def average_rating
    average = 0
    count = 0 
    ratings.find_each do |rating|
      next if rating.rating.nil?
      average += rating.rating
      count += 1 
    end

    average.to_f / count
  end


end
