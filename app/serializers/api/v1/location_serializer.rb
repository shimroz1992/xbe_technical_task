# This file needs to be checked
module Api
  module V1
    class LocationSerializer < ActiveModel::Serializer
      attributes :id, :name, :latitude, :longitude
    end
  end
end
