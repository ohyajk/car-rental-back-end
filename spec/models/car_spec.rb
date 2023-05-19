require 'rails_helper'

RSpec.describe Car, type: :model do
  subject do
    myuser = User.create(name: 'Eddy', username: 'pray', email: 'eddy@gmail.com', role: 'admin',
                         password_digest: '123456')
    Car.create(name: 'toyota', model: 'v8', description: 'the best car in the city', integer: 1, price: 200.7,
               rent_per_day: 2, user_id: myuser.id)
  end
  before { subject.save }

  it 'Should be valid ' do
    expect(subject).to be_valid
  end

  it 'Name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'car should have a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'Price should me in decimals' do
    subject.price = 200.4
    expect(subject).to be_valid
  end

  it 'rent per day should be greater than or equal to zero' do
    subject.rent_per_day = -1
    expect(subject).to_not be_valid
  end
end
