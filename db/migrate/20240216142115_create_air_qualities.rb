class CreateAirQualities < ActiveRecord::Migration[7.0]
  def change
    create_table :air_qualities do |t|
      t.references :location, null: false, foreign_key: true
      t.integer :aqi
      t.json :pollutant_concentrations
      t.datetime :timestamp

      t.timestamps
    end
  end
end
