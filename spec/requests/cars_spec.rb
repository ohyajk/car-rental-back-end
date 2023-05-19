require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:users).through(:reservations) }
  end

  describe 'validations' do
    it { should validate_length_of(:name).is_at_least(4) }
    it { should validate_length_of(:description).is_at_most(2000) }
    it { should validate_numericality_of(:rent_per_day).is_greater_than_or_equal_to(0) }
  end
end
