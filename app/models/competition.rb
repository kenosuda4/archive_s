class Competition < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    has_many :records, dependent: :destroy

    with_options presence: true do
        validates :name
        validates :user_id
        validates :genre_id
        validates :summary
    end
    validates :is_valid, inclusion: { in: [true, false] }
end