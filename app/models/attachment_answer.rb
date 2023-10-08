class AttachmentAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :station_submission
  has_one_attached :payload
end
