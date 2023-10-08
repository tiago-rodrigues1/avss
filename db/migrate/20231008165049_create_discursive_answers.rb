class CreateDiscursiveAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :discursive_answers do |t|
      t.references :question, null: false, foreign_key: true
      t.references :station_submission, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
