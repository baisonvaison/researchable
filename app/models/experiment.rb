class Experiment < ApplicationRecord
    belongs_to :user
    belongs_to :protocol 
    belongs_to :category
    has_many :comments
    attr_accessor :staff, :category, :protocol, :new_category
    
    default_scope -> { order(created_at: :desc) }
      
    validates :title, presence: true, length: { maximum: 20 } #仮で２０とした。不要かも
    validates :date, presence: true
    validates :overview, presence: true
    validates :result, presence: true
    validates :user_id, presence: true
    
    mount_uploader :image, ImageUploader
    
end
