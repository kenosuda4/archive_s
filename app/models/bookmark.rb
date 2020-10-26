class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :menu

  def self.sort(selection)
    case selection
    when 'new'
        return Menu.order(created_at: :DESC)
    when 'old'
        return Menu.order(created_at: :ASC)
    end
  end
end
