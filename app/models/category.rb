class Category < ApplicationRecord
    validates :category, presence:true
    belongs_to :experiment
end
