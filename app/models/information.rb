class Information < ApplicationRecord
    with_options presence: true do
        validates :title
        validates :info_content
    end
    validates :is_valid, inclusion: {in: [true, false]}
    
end
