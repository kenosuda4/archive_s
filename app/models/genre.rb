class Genre < ApplicationRecord
    has_many :menus
    validates :name, presence: true, length: {maximum: 20}
end
