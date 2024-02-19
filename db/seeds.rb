locations_data = [
  { name: 'Mumbai', latitude: 19.0760, longitude: 72.8777 },
  { name: 'Delhi', latitude: 28.6139, longitude: 77.2090 },
  { name: 'Bangalore', latitude: 12.9716, longitude: 77.5946 },
  { name: 'Hyderabad', latitude: 17.3850, longitude: 78.4867 },
  { name: 'Chennai', latitude: 13.0827, longitude: 80.2707 },
  { name: 'Kolkata', latitude: 22.5726, longitude: 88.3639 },
  { name: 'Ahmedabad', latitude: 23.0225, longitude: 72.5714 },
  { name: 'Pune', latitude: 18.5204, longitude: 73.8567 },
  { name: 'Jaipur', latitude: 26.9124, longitude: 75.7873 },
  { name: 'Lucknow', latitude: 26.8467, longitude: 80.9462 },
  { name: 'Kanpur', latitude: 26.4499, longitude: 80.3319 },
  { name: 'Nagpur', latitude: 21.1458, longitude: 79.0882 },
  { name: 'Indore', latitude: 22.7196, longitude: 75.8577 },
  { name: 'Thane', latitude: 19.2183, longitude: 72.9781 },
  { name: 'Bhopal', latitude: 23.2599, longitude: 77.4126 },
  { name: 'Visakhapatnam', latitude: 17.6868, longitude: 83.2185 },
  { name: 'Patna', latitude: 25.5941, longitude: 85.1376 },
  { name: 'Vadodara', latitude: 22.3072, longitude: 73.1812 },
  { name: 'Srinagar', latitude: 34.0836, longitude: 74.7973 },
  { name: 'Ludhiana', latitude: 30.9010, longitude: 75.8573 }
]

locations_data.each do |location|
  Location.create!(location)
  start_date = "Mon, 19 Feb 2023 18:02:13 +0530"
  end_date = "Mon, 19 Feb 2024 18:02:13 +0530"
  latitude = location[:latitude]
  longitude = location[:longitude]
  historical_data = WeatherService.new.fetch_historical_air_quality(latitude, longitude, start_date, end_date)
  ImportService.new.send(:create_air_quality, location, historical_data)
end
