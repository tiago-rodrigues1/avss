class AddUserReferenceToCircuit < ActiveRecord::Migration[7.0]
  def change
    add_reference :circuits, :user, null: false, foreign_key: true
  end
end
