class AddStationToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :station, null: false, foreign_key: true
  end
end
