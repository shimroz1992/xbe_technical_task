# This file needs to be checked
require 'rails_helper'

RSpec.describe AirQuality, type: :model do
  let(:location) { FactoryBot.create(:location) }

  it 'is valid with valid attributes' do
    air_quality = FactoryBot.build(:air_quality, location: location)
    expect(air_quality).to be_valid
  end

  it 'is not valid without an AQI' do
    air_quality = FactoryBot.build(:air_quality, location: location, aqi: nil)
    expect(air_quality).not_to be_valid
  end

  it 'is not valid without pollutant concentrations' do
    air_quality = FactoryBot.build(:air_quality, location: location, pollutant_concentrations: nil)
    expect(air_quality).not_to be_valid
  end

  it 'is not valid without a timestamp' do
    air_quality = FactoryBot.build(:air_quality, location: location, timestamp: nil)
    expect(air_quality).not_to be_valid
  end
end
