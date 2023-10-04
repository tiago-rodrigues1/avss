class ObjectiveAnswer < ApplicationRecord
  belongs_to :question_alternative
  belongs_to :question
  belongs_to :station_submission
end
