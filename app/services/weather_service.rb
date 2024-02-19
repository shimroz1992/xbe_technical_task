require 'httparty'

class WeatherService
  include HTTParty

  base_uri 'https://api.openweathermap.org/data/2.5'

  attr_reader :api_calls

  def initialize
    @api_key = ENV['OPENWEATHERMAP_API_KEY']
    @api_limit_threshold = 1000
    @api_calls = ApiCallTracker.new
  end

  def fetch_current_air_quality(latitude, longitude)
    record_api_call
    response = get_air_pollution(latitude, longitude)
    handle_response(response)
  end

  def fetch_geocoding_data(latitude, longitude)
    record_api_call
    response = get_geocoding(latitude, longitude)
    handle_response(response)
  end

  def fetch_historical_air_quality(latitude, longitude, start_date, end_date)
    record_api_call
    response = get_historical_air_pollution(latitude, longitude, start_date, end_date)
    handle_response(response)
  end

  def check_api_limit
    if api_calls.within_last_day >= @api_limit_threshold
      raise "API rate limit exceeded"
    end
  end

  private

  def handle_response(response)
    case response.code
    when 200..299
      JSON.parse(response.body)
    when 404
      raise "Not found: #{response.message}"
    when 401
      raise "Unauthorized: #{response.message}"
    when 400..499
      raise "Client error: #{response.code}: #{response.message}"
    when 500..599
      raise "Server error: #{response.code}: #{response.message}"
    else
      raise "Unexpected response: #{response.code}: #{response.message}"
    end
  end

  def record_api_call
    @api_calls.record(Time.now)
  end

  def get_air_pollution(latitude, longitude)
    self.class.get("/air_pollution?lat=#{latitude}&lon=#{longitude}&appid=#{@api_key}")
  end

  def get_geocoding(latitude, longitude)
    base_uri = 'https://api.openweathermap.org'
    self.class.get("#{base_uri}/geo/1.0/reverse?lat=#{latitude}&lon=#{longitude}&appid=#{@api_key}")
  end

  def get_historical_air_pollution(latitude, longitude, start_date, end_date)
    start_unix_time = start_date.to_time.to_i
    end_unix_time = end_date.to_time.to_i
    self.class.get("/air_pollution/history?lat=#{latitude}&lon=#{longitude}&start=#{start_unix_time}&end=#{end_unix_time}&appid=#{@api_key}")
  end
end

class ApiCallTracker
  attr_reader :calls

  def initialize
    @calls = []
  end

  def record(timestamp)
    @calls << timestamp
  end

  def within_last_day
    @calls.select { |time| time >= 1.day.ago }.count
  end
end
