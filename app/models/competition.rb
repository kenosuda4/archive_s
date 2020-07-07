class Competition < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    has_many :records, dependent: :destroy
    
    validates :is_valid, inclusion: { in: [true, false] }
end