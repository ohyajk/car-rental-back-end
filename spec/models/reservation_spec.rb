require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject do
    myuser = User.create(name: 'Eddy')
    mycar = Car.create(name: 'toyota', model: 'v8', description: 'the best car in the city', price: 200.7,
                       rent_per_day: 2, user_id: myuser.id)
    Reservation.create(
      start_date: Date.today,
      end_date: Date.tomorrow,
      price_per_day: 50.00,
      city: 'New York',
      car_id: mycar.id,
      user_id: myuser.id
    )
  end
  before { subject.save }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a price per one day' do
      subject.price_per_day = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a city' do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it 'is should always have a city name' do
      subject.city = 'Oklahoma'
      expect(subject).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      expect(subject.user).to be_instance_of(User)
    end

    it 'has many reservations' do
      expect(subject.car).to be_instance_of(Car)
    end
  end
end
