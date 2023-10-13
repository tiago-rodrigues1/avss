class ObjectiveAnswer < ApplicationRecord
  belongs_to :question_alternative
  belongs_to :question
  belongs_to :station_submission

  def points
    if question_alternative.correct
      question.score
    else
      0
    end
  end
end
