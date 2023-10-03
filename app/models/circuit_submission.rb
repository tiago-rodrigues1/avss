class CircuitSubmission < ApplicationRecord
  belongs_to :circuit_application
  has_many :station_submissions, dependent: :destroy
end
