class Rating < ActiveRecord::Base
  belongs_to :visitor, class_name: 'User'
  belongs_to :visited, class_name: 'Booking'
  has_many :invitations

  def self.was_i_invited?(rating_id, visited_id, visited_date)
    res = false
    r = where(visited_id: visited_id,
              visited_date: visited_date)
    my_r = Rating.find(rating_id)
    r.each do |tmp|
      res = true if my_r.created_at < tmp.created_at
    end
    res
  end
end
