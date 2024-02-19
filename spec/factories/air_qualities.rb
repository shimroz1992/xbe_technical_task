FactoryBot.define do
  factory :air_quality do
    association :location
    aqi { 50 }
    pollutant_concentrations { { 'CO': 10, 'SO2': 5 } }
    timestamp { Time.now }
  end
end
