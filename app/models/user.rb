class User < ApplicationRecord
  #include ActiveModel::Model
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  belongs_to :affiliation
  has_many :experiments, dependent: :destroy
<<<<<<< HEAD
  has_many :comments, dependent: :destroy
=======
>>>>>>> experimentの作成中。
         
  validates :first_name, presence: true
  validates :last_name, presence: true
  mount_uploader :avatar, AvatarUploader
  
  
end
