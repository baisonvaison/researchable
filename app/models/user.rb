class User < ApplicationRecord
  #include ActiveModel::Model
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  belongs_to :affiliation
  has_many :experiments, dependent: :destroy
  has_many :comments, dependent: :destroy
         
  validates :first_name, presence: true
  validates :last_name, presence: true
  mount_uploader :avatar, AvatarUploader
  
  
end
