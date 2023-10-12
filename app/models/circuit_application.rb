class CircuitApplication < ApplicationRecord
  belongs_to :circuit
  has_many :circuit_submissions, dependent: :destroy

  def submissions_count
    return circuit_submissions.count
  end
end
