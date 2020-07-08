class Record < ApplicationRecord
    belongs_to :user
    belongs_to :competition
    belongs_to :athletic_event
    has_many :raps, dependent: :destroy

    with_options presence: true do
        validates :user_id
        validates :competition_id
        validates :athletic_event_id
        validates :name
        validates :time
    end
end
