class Question < ApplicationRecord
  belongs_to :station
  has_many :question_alternatives, dependent: :destroy

  def create_answer(station_submission)
    if kind == 3
      create_objective_answer(station_submission)
    end
  end

  def create_objective_answer(station_submission)
    ans = ObjectiveAnswer.where(station_submission: station_submission, question: self)
  
    if ans.size == 0
      ans = ObjectiveAnswer.new
      ans.question_id = id
      ans.station_submission = station_submission
      ans.question_alternative = QuestionAlternative.first
      ans.save
    end
  end
end
