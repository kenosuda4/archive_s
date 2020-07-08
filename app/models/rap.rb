class Rap < ApplicationRecord
    belongs_to :user
    belongs_to :record

    with_options presence: true do
        validates :user_id
        validates :record_id
        validates :distance
        validates :rap_time
    end
end
