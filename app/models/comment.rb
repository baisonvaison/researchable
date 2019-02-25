class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :experiment
<<<<<<< HEAD
=======
    validates :comment, presence: true
>>>>>>> comment
end
