class Reservation < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price_per_day, numericality: { greater_than_or_equal_to: 0 }
  validates :city, presence: true, length: { maximum: 100 }
end
