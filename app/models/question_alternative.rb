class QuestionAlternative < ApplicationRecord
  belongs_to :question
  has_many :objective_answers, dependent: :destroy
end
