class Affiliation < ApplicationRecord
    validates :university,  presence: true
    validates :department, presence: true
    validates :course,  presence: true
    validates :labo, presence: true
    validates :cord, presence: true, length: { minimum: 8 }
    has_many :users
    has_many :protocols
    has_many :experiments
end
