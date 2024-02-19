class AirQuality < ApplicationRecord
  belongs_to :location

  validates :aqi, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :pollutant_concentrations, presence: true
  validates :timestamp, presence: true
end
