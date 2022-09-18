class Request < ApplicationRecord
    
    has_many :reports, dependent: :destroy
    has_many :request_comments, dependent: :destroy
    has_many :request_likes, dependent: :destroy
    belongs_to :user
    belongs_to :area
    
    validates :area_id, :title, :request_sentence, presence: true
    
    def request_liked_by?(user)
        request_likes.exists?(user_id: user.id)
    end
end
