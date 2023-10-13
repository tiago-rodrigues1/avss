class RemoveScoreFromStation < ActiveRecord::Migration[7.0]
  def change
    remove_column :stations, :score
  end
end
