class AthleticEvent < ApplicationRecord
    has_many :records
    validates :name, presence: true, length: {maximum: 30}
end
