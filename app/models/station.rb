class Station < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many_attached :attachments, dependent: :destroy
end
