class Circuit < ApplicationRecord
  belongs_to :user
  has_many :circuit_stations, dependent: :destroy
  has_many :stations, through: :circuit_stations
  has_many :circuit_applications, dependent: :destroy
end
