class Competition < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    
    validates :is_valid, inclusion: { in: [true, false] }
end