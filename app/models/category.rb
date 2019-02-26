class Category < ApplicationRecord
    validates :category_name, presence: true
    has_many :experiments
    has_many :protocols
end
