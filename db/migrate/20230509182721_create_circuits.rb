class CreateCircuits < ActiveRecord::Migration[7.0]
  def change
    create_table :circuits do |t|
      t.string :title
      t.text :resume

      t.timestamps
    end
  end
end
