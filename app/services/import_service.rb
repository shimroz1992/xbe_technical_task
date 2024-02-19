# This file needs to be checked
class ImportService
  def initialize(weather_service = WeatherService.new)
    @weather_service = weather_service
  end

  def import_data
    Location.all.each do |location|
      begin
        current_air_quality = @weather_service.fetch_current_air_quality(location.latitude, location.longitude)
        create_air_quality(location, current_air_quality)
      rescue StandardError => e
        Rails.logger.error("Error importing air quality data for location #{location.id}: #{e.message}")
      end
    end
  end

  private

  def create_air_quality(location, air_quality_data)
    air_quality_attrs = {
      aqi: air_quality_data.dig('list', 0, 'main', 'aqi'),
      pollutant_concentrations: air_quality_data.dig('list', 0, 'components'),
      timestamp: Time.now
    }
    location.air_qualities.create(air_quality_attrs)
  end
end
