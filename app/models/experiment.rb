class Experiment < ApplicationRecord
    acts_as_taggable
    belongs_to :user
    belongs_to :protocol 
    belongs_to :category
    belongs_to :affiliation
    has_many :comments, dependent: :destroy
    attr_accessor :new_category
      
    validates :title, presence: true, length: { maximum: 20 } #仮で２０とした。不要かも
    validates :date, presence: true
    validates :overview, presence: true
    validates :result, presence: true
    validates :user_id, presence: true
    
    mount_uploader :image, ImageUploader
    
    #検索機能
    def self.search(keyword, user)
        return Experiment.where("affiliation_id = ?", user.affiliation_id) unless keyword
        Experiment.where('title LIKE ? AND affiliation_id = ?', "%#{keyword}%", user.affiliation_id).distinct
    end
    
    def self.search_admin(keyword)
        return Experiment.all unless keyword
        Experiment.where('title LIKE ?', "%#{keyword}%").distinct
    end
end
