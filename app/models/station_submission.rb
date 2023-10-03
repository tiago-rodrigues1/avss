class StationSubmission < ApplicationRecord
  belongs_to :circuit_submission
  belongs_to :station
end
