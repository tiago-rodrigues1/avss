class CircuitSubmission < ApplicationRecord
  belongs_to :circuit_application
  has_many :station_submissions, dependent: :destroy

  def points
    acc = 0
    station_submissions.each do |sb|
      acc += sb.points
    end

    acc
  end
end
