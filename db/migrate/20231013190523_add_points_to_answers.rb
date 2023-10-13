class AddPointsToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :objective_answers, :points, :integer
    add_column :discursive_answers, :points, :integer
    add_column :attachment_answers, :points, :integer
  end
end
