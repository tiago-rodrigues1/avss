class CreateCircuitStations < ActiveRecord::Migration[7.0]
  def change
    create_table :circuit_stations do |t|
      t.references :station, null: false, foreign_key: true
      t.references :circuit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
