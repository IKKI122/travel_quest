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
  
end
