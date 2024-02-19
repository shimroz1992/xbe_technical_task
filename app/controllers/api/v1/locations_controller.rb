module Api
  module V1
    class LocationsController < ApplicationController
      include Swagger::Blocks

      swagger_path '/api/v1/locations' do
        operation :get do
          key :description, 'Returns all locations'
          key :operationId, 'index'
          key :tags, ['Locations']
          parameter name: :page, in: :query, description: 'Page number', required: false, type: :integer
          parameter name: :per_page, in: :query, description: 'Items per page', required: false, type: :integer
          response 200 do
            key :description, 'List of locations'
            schema type: :array do
              items { key :'$ref', :Location }
            end
          end
        end
      end

      swagger_path '/api/v1/locations/{id}' do
        operation :get do
          key :description, 'Returns a single location by ID'
          key :operationId, 'show'
          key :tags, ['Locations']
          parameter name: :id, in: :path, description: 'Location ID', required: true, type: :integer
          response 200 do
            key :description, 'Location details'
            schema { key :'$ref', :Location }
          end
          response 404 do
            key :description, 'Location not found'
          end
        end
      end

      swagger_path '/api/v1/locations/{id}/air_qualities' do
        operation :get do
          key :description, 'Returns air qualities for a location'
          key :operationId, 'air_qualities'
          key :tags, ['Locations']
          parameter name: :id, in: :path, description: 'Location ID', required: true, type: :integer
          parameter name: :page, in: :query, description: 'Page number', required: false, type: :integer
          parameter name: :per_page, in: :query, description: 'Items per page', required: false, type: :integer
          response 200 do
            key :description, 'List of air qualities'
            schema type: :array do
              items { key :'$ref', :AirQuality }
            end
          end
          response 404 do
            key :description, 'Location not found'
          end
        end
      end

      def index
        @locations = Location.page(params[:page]).per(params[:per_page] || 10)
        render json: @locations, each_serializer: LocationSerializer
      end

      def show
        @location = Location.find(params[:id])
        render json: @location, serializer: LocationSerializer
      end

      def air_qualities
        @location = Location.find(params[:id])
        @air_qualities = @location.air_qualities.page(params[:page]).per(params[:per_page] || 10)
        render json: @air_qualities, each_serializer: AirQualitySerializer
      end
    end
  end
end
