class RequestComment < ApplicationRecord
    
    belongs_to :user
    belongs_to :request
    
    validates :comment, presence: true
    
end
