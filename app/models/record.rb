class Record < ApplicationRecord
    belongs_to :user
    belongs_to :competition
    belongs_to :athletic_event
    has_many :raps, dependent: :destroy
end
