class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.text :context
      t.text :procedure
      t.text :evaluation
      t.integer :time
      t.integer :difficulty
      t.integer :score

      t.timestamps
    end
  end
end
