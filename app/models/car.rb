class Car < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :users, through: :reservations
  validates :name, presence: true
  validates :description, length: { maximum: 2000 }
  validates :rent_per_day, comparison: { greater_than_or_equal_to: 0 }
end
