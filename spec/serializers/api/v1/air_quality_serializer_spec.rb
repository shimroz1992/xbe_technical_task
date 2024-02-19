# This file needs to be checked
require 'rails_helper'

RSpec.describe Api::V1::AirQualitySerializer, type: :serializer do
  let(:air_quality) { FactoryBot.create(:air_quality) } # Using FactoryBot to create an AirQuality instance

  subject { described_class.new(air_quality).as_json }

  it 'serializes the air quality attributes' do
    expect(subject).to include(
      id: air_quality.id,
      location_id: air_quality.location_id,
      aqi: air_quality.aqi,
      pollutant_concentrations: air_quality.pollutant_concentrations,
      timestamp: air_quality.timestamp
    )
  end
end
