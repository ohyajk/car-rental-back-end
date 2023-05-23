class User < ApplicationRecord
  has_many :cars
  has_many :reservations

  validates :name, presence: true, length: { minimum: 3 }
end
