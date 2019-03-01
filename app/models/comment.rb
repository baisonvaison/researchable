class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :experiment
    validates :comment, presence: true
end
