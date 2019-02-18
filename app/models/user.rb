class User < ApplicationRecord
  #include ActiveModel::Model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  belongs_to :affiliation
         
  validates :first_name, presence: true
  validates :last_name, presence: true

end
