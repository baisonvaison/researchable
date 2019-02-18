class Affiliation < ApplicationRecord
    attr_accessor :password
    validates :university,  presence: true
    validates :department, presence: true
    validates :course,  presence: true
    validates :labo, presence: true
    validates :cord, presence: true, length: { minimum: 8 }
end
