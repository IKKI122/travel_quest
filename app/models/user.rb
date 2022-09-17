class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_one_attached :profile_image
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :relationships, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :report_comments, dependent: :destroy
  has_many :report_likes, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :request_comments, dependent: :destroy
  has_many :request_likes, dependent: :destroy
  
  validates :user_name, uniqueness: true, length: {minimum: 2, maximum: 20}
  validates :self_introduction, length: {maximum: 50}
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
