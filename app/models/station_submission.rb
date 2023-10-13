class StationSubmission < ApplicationRecord
  belongs_to :circuit_submission
  belongs_to :station
  has_many :objective_answers, dependent: :destroy
  has_many :discursive_answers, dependent: :destroy
  has_many :attachment_answers, dependent: :destroy

  def points
    acc = 0

    objective_answers.each do |a|
      acc += a.points
    end

    discursive_answers.each do |a|
      acc += a.points
    end

    attachment_answers.each do |a|
      acc += a.points
    end

    acc
  end
end
