class Question < ApplicationRecord
  belongs_to :station
  has_many :question_alternatives, dependent: :destroy
end
