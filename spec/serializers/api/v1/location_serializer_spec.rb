# This file needs to be checked
require 'rails_helper'

RSpec.describe Api::V1::LocationSerializer, type: :serializer do
  let(:location) { FactoryBot.create(:location) } # Using FactoryBot to create a Location instance

  subject { described_class.new(location).as_json }

  it 'serializes the location attributes' do
    expect(subject).to include(
      id: location.id,
      name: location.name,
      latitude: location.latitude,
      longitude: location.longitude
    )
  end
end
