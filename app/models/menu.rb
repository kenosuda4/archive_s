class Menu < ApplicationRecord
    belongs_to :user
    belongs_to :genre

    with_options presence: true do
        validates :name
        validates :genre_id
        validates :total_distance
    end
    validates :is_valid, inclusion: {in: [true, false]}
    mount_uploader :image, ImageUploader
end
