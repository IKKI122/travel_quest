class Request < ApplicationRecord
    
    has_many :reports, dependent: :destroy
    has_many :request_comments, dependent: :destroy
    has_many :request_likes, dependent: :destroy
    belongs_to :user
    belongs_to :area
    
end
