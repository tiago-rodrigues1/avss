class CreateAttachmentAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :attachment_answers do |t|
      t.references :question, null: false, foreign_key: true
      t.references :station_submission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
