class Area < ApplicationRecord
    
    has_many :reports, dependent: :destroy
    
end
