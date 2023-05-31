class AddTitleToStation < ActiveRecord::Migration[7.0]
  def change
    add_column :stations, :title, :string
  end
end
