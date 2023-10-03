class CreateCircuitSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :circuit_submissions do |t|
      t.references :circuit_application, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :registration

      t.timestamps
    end
  end
end
