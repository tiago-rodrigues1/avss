class RemovePointsFromObjectiveAnswers < ActiveRecord::Migration[7.0]
  def change
    remove_column :objective_answers, :points
  end
end
