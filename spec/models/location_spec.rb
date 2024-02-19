require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'is valid with valid attributes' do
    location = FactoryBot.build(:location)
    expect(location).to be_valid
  end

  it 'is not valid without a name' do
    location = FactoryBot.build(:location, name: nil)
    expect(location).not_to be_valid
  end

  it 'is not valid without a latitude' do
    location = FactoryBot.build(:location, latitude: nil)
    expect(location).not_to be_valid
  end

  it 'is not valid without a longitude' do
    location = FactoryBot.build(:location, longitude: nil)
    expect(location).not_to be_valid
  end

  it 'is not valid with latitude outside the range' do
    location = FactoryBot.build(:location, latitude: 100)
    expect(location).not_to be_valid
  end

  it 'is not valid with longitude outside the range' do
    location = FactoryBot.build(:location, longitude: 200)
    expect(location).not_to be_valid
  end
end
