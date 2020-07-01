class Menu < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    has_many :bookmarks
    #名前を被らせない sourceで参照
    has_many :bookmarks_users, through: :bookmarks, source: :user
    def bookmarked_by?(user)
        bookmarks.where(user_id: user.id).exists?
    end

    with_options presence: true do
        validates :name
        validates :genre_id
        validates :total_distance
    end
    validates :is_valid, inclusion: {in: [true, false]}
    mount_uploader :image, ImageUploader
end
