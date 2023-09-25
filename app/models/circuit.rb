class Circuit < ApplicationRecord
  belongs_to :user
  has_many :circuit_stations
  has_many :stations, through: :circuit_stations
end
