# This file needs to be checked
require 'rails_helper'

RSpec.describe Api::V1::LocationsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns all locations" do
      location1, location2 = FactoryBot.create_list(:location, 2)

      get :index
      expect(assigns(:locations)).to contain_exactly(location1, location2)
    end
  end

  describe "GET #show" do
    let(:location) { FactoryBot.create(:location) }

    it "returns a success response" do
      get :show, params: { id: location.id }
      expect(response).to have_http_status(:success)
    end

    it "returns the correct location" do
      get :show, params: { id: location.id }
      expect(assigns(:location)).to eq(location)
    end
  end

  describe "GET #air_qualities" do
    let(:location) { FactoryBot.create(:location) }

    it "returns a success response" do
      get :air_qualities, params: { id: location.id }
      expect(response).to have_http_status(:success)
    end

    it "returns all air qualities of the location" do
      air_quality1, air_quality2 = FactoryBot.create_list(:air_quality, 2, location: location)

      get :air_qualities, params: { id: location.id }
      expect(assigns(:air_qualities)).to contain_exactly(air_quality1, air_quality2)
    end
  end
end
