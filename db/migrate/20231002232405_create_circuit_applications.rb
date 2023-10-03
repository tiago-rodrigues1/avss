class CreateCircuitApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :circuit_applications do |t|
      t.references :circuit, null: false, foreign_key: true
      t.string :link

      t.timestamps
    end
  end
end
