class CreateQuestionAlternatives < ActiveRecord::Migration[7.0]
  def change
    create_table :question_alternatives do |t|
      t.text :body
      t.references :question, null: false, foreign_key: true
      t.boolean :correct

      t.timestamps
    end
  end
end
