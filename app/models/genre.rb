class Genre < ApplicationRecord
    has_many :menus
    has_many :competitions
    validates :name, presence: true, length: {maximum: 20}
end
