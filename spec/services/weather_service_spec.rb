# This file needs to be checked
require 'rails_helper'
require 'vcr'

RSpec.describe WeatherService do
  describe '#fetch_current_air_quality' do
    it 'fetches current air quality data' do
      VCR.use_cassette('current_air_quality') do
        service = WeatherService.new
        latitude = 37.7749
        longitude = -122.4194

        expect {
          service.fetch_current_air_quality(latitude, longitude)
        }.not_to raise_error
      end
    end
  end

  describe '#fetch_geocoding_data' do
    it 'fetches geocoding data' do
      VCR.use_cassette('geocoding_data') do
        service = WeatherService.new
        latitude = 37.7749
        longitude = -122.4194

        expect {
          service.fetch_geocoding_data(latitude, longitude)
        }.not_to raise_error
      end
    end
  end

  describe '#fetch_historical_air_quality' do
    it 'fetches historical air quality data' do
      VCR.use_cassette('historical_air_quality') do
        service = WeatherService.new
        latitude = 37.7749
        longitude = -122.4194
        start_date = Time.now - 7.days
        end_date = Time.now

        expect {
          service.fetch_historical_air_quality(latitude, longitude, start_date, end_date)
        }.not_to raise_error
      end
    end
  end

  describe '#check_api_limit' do
    let(:service) { WeatherService.new }

    it 'does not raise error when API limit is not exceeded' do
      VCR.use_cassette('fetch_current_air_quality') do
        # Use VCR to record the API request made within fetch_current_air_quality
        expect {
          10.times { service.fetch_current_air_quality(37.7749, -122.4194) }
          service.check_api_limit
        }.not_to raise_error
      end
    end
  end
end
