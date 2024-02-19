# This file needs to be checked
require 'rails_helper'

RSpec.describe ImportService do
  describe '#import_data' do
    let(:service) { ImportService.new }

    before do
      @location = FactoryBot.create(:location) # Assuming you have a factory for Location objects
      allow(Location).to receive(:all).and_return([@location])
    end

    it 'imports air quality data for each location' do
      allow_any_instance_of(WeatherService).to receive(:fetch_current_air_quality).and_return(
        {
          'list' => [{
            'main' => {'aqi' => 2},
            'components' => {'co' => 0.2, 'no' => 0.3},
          }]
        }
      )

      expect {
        service.import_data
      }.to change { AirQuality.count }.by(1)
    end

    it 'imports air quality data with correct attributes' do
      allow_any_instance_of(WeatherService).to receive(:fetch_current_air_quality).and_return(
        {
          'list' => [{
            'main' => {'aqi' => 2},
            'components' => {'co' => 0.2, 'no' => 0.3},
          }]
        }
      )

      service.import_data
      air_quality = AirQuality.last

      expect(air_quality.aqi).to eq(2)
      expect(air_quality.pollutant_concentrations).to eq({'co' => 0.2, 'no' => 0.3})
      expect(air_quality.location.latitude).to eq(@location.latitude)
      expect(air_quality.location.longitude).to eq(@location.longitude)
    end

    it 'does not import data if no locations are present' do
      allow(Location).to receive(:all).and_return([])

      expect {
        service.import_data
      }.not_to change { AirQuality.count }
    end

    it 'handles errors gracefully' do
      allow_any_instance_of(WeatherService).to receive(:fetch_current_air_quality).and_raise("Error")

      expect {
        service.import_data
      }.not_to change { AirQuality.count }
    end
  end
end
