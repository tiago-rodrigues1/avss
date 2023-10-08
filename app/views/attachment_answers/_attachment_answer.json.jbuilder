json.extract! attachment_answer, :id, :question_id, :station_submission_id, :payload, :created_at, :updated_at
json.url attachment_answer_url(attachment_answer, format: :json)
json.payload url_for(attachment_answer.payload)
