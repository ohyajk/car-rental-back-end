class Car < ApplicationRecord
  belongs_to :user
  has_many :users, through: :reservations
end
