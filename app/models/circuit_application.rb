class CircuitApplication < ApplicationRecord
  belongs_to :circuit
  has_many :circuit_submissions, dependent: :destroy
end
