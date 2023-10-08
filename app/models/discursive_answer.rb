class DiscursiveAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :station_submission
end
