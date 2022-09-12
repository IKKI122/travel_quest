class Report < ApplicationRecord
    
    has_many_attached :report_images
    
    has_many :report_comments, dependent: :destroy
    has_many :report_likes, dependent: :destroy
    belongs_to :user
    belongs_to :request
    
    validates :report_sentence, presence: true
    
    def get_report_image(width, height)
        unless report_image.attached?
            file_path = Rails.root.join('app/assets/images/no_image.jpg')
            report_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        report_image.variant(resize_to_limit: [width, height]).processed
    end
    
end
