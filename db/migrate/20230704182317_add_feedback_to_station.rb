class AddFeedbackToStation < ActiveRecord::Migration[7.0]
  def change
    add_column :stations, :feedback, :boolean
  end
end
