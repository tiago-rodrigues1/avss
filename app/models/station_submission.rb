class StationSubmission < ApplicationRecord
  belongs_to :circuit_submission
  belongs_to :station
  has_many :objective_answers, dependent: :destroy
  has_many :discursive_answers, dependent: :destroy
  has_many :attachment_answers, dependent: :destroy
end
