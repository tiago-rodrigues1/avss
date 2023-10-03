class AddDescriptionToCircuitApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :circuit_applications, :description, :string
  end
end
