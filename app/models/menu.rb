class Menu < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    has_many :bookmarks, dependent: :destroy
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

    def self.sort(selection)
        case selection
        when 'new'
            return where(is_valid: true).order(created_at: :DESC)
        when 'old'
            return where(is_valid: true).order(created_at: :ASC)
        when 'bookmarks'
            return find(Bookmark.group(:menu_id).order(Arel.sql('count(menu_id) desc')).pluck(:menu_id))
        end
    end
end
