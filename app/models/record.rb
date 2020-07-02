class Record < ApplicationRecord
    belongs_to :user
    belongs_to :competition
    belongs_to :athletic_event
end
