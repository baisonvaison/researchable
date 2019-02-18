class Experiment < ApplicationRecord
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
      
    validates :title, presence: true, length: { maximum: 20 } #仮で２０とした。不要かも
    validates :date, presence: true
    validates :overview, presence: true
    validates :result, presence: true
    validates :experiment, presence: true
    validates :user_id, presence: true
end
