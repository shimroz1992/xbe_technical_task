# This file needs to be checked
module Api
  module V1
    class AirQualitySerializer < ActiveModel::Serializer
      attributes :id, :location_id, :aqi, :pollutant_concentrations, :timestamp

      def pollutant_concentrations
        object.pollutant_concentrations.transform_keys(&:to_s) # Convert keys to strings
      end
    end
  end
end
