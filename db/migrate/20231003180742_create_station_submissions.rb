class CreateStationSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :station_submissions do |t|
      t.references :circuit_submission, null: false, foreign_key: true
      t.references :station, null: false, foreign_key: true

      t.timestamps
    end
  end
end
