json.extract! station_submission, :id, :circuit_submission_id, :station_id, :created_at, :updated_at
json.url station_submission_url(station_submission, format: :json)
