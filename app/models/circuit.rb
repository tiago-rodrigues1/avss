class Circuit < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :resume, presence: true
end
