class Station < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :attachments, dependent: :destroy
end
