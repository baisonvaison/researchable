class User < ApplicationRecord
  #include ActiveModel::Model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #belongs_to :affiliation
         
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  # 与えられた文字列のハッシュ値を返す
    def Affiliation.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
