class Meal < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validate :positive_price
  belongs_to :restaurant

  def positive_price
    errors.add(:price,' must be equal or greater than zero!') unless price && price >= 0
  end
end
