class Affiliation < ApplicationRecord
    attr_accessor :password
    validates :university,  presence: true
    validates :department, presence: true
    validates :course,  presence: true
    validates :labo, presence: true
    has_secure_password
    has_many :users
    
    # 与えられた文字列のハッシュ値を返す
    def Affiliation.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
