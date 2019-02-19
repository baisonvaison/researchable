class Experiment < ApplicationRecord
    belongs_to :user
    belongs_to :protocl
    has_one :category
    accepts_nested_attributes_for :category, allow_destroy: true
    has_many :images
    accepts_nested_attributes_for :images, allow_destroy: true
    
    default_scope -> { order(created_at: :desc) }
      
    validates :title, presence: true, length: { maximum: 20 } #仮で２０とした。不要かも
    validates :date, presence: true
    validates :overview, presence: true
    validates :result, presence: true
    validates :user_id, presence: true
    validates :category_id, presence: true
    validates :protocol_id, presence: true
    #validates :image_id, presence: true
    
    mount_uploader :image, ImageUploader
    
    #include ActiveModel::Model
    
    #concerning :ExperimentBuilder do
        #def experiment
    #end
end
