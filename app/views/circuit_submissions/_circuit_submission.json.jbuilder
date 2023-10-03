json.extract! circuit_submission, :id, :circuit_application_id, :name, :email, :registration, :created_at, :updated_at
json.url circuit_submission_url(circuit_submission, format: :json)
