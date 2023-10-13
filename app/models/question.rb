class Question < ApplicationRecord
  belongs_to :station
  has_many :question_alternatives, dependent: :destroy
  has_many :discursive_answers, dependent: :destroy
  has_many :objective_answers, dependent: :destroy
  has_many :attachment_answers, dependent: :destroy

  def create_answer(station_submission)
    if kind == 1
      create_discursive_answer(station_submission)
    elsif kind == 2
      create_attachment_answer(station_submission)
    elsif kind == 3
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

  def create_attachment_answer(station_submission)
    ans = AttachmentAnswer.where(station_submission: station_submission, question: self)
  
    if ans.size == 0
      ans = AttachmentAnswer.new
      ans.question_id = id
      ans.station_submission = station_submission
      ans.points = 0
      ans.save
    end
  end

  def create_discursive_answer(station_submission)
    ans = DiscursiveAnswer.where(station_submission: station_submission, question: self)
  
    if ans.size == 0
      ans = DiscursiveAnswer.new
      ans.question_id = id
      ans.station_submission = station_submission
      ans.points = 0
      ans.save
    end

  end
end
