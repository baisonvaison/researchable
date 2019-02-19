class Experiment < ApplicationRecord
    belongs_to :user
    has_one :category
    has_one :protocl
    default_scope -> { order(created_at: :desc) }
      
    validates :title, presence: true, length: { maximum: 20 } #仮で２０とした。不要かも
    validates :date, presence: true
    validates :overview, presence: true
    validates :result, presence: true
    validates :user_id, presence: true
    validates :category_id, presence: true
    validates :protocol_id, presence: true
    #validates :image_id, presence: true
end
