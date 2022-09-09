class Report < ApplicationRecord
    
    has_one_attached :report_image
    
    has_many :report_comments, dependent: :destroy
    has_many :report_likes, dependent: :destroy
    belongs_to :user
    belongs_to :request
    
end
