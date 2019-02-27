class Protocol < ApplicationRecord
  belongs_to :user
  belongs_to :affiliation
  belongs_to :category
  has_many :procedures, inverse_of: :protocol, dependent: :destroy
  has_many :experiments

  attr_accessor :new_category

  acts_as_taggable

  accepts_nested_attributes_for :procedures, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
  validates :status, presence: true
  validates :parent_id, presence: true

  enum status: {base: 0, custom: 1, template: 2}

  # Constant for enum
  BASE = 0
  CUSTOM = 1
  TEMPLATE =2

  # add position to procedures
  after_save do |protocol|
    procedures = Procedure.where(protocol_id: protocol.id)
    add_position = 0
    procedures.each do |procedure|
      add_position += 1
      procedure.position = add_position
      procedure.save!
    end
  end
  
  #検索機能
  def self.search(keyword, num, user)
    return Protocol.where("status =? AND affiliation_id = ?", num, user.affiliation_id) unless keyword
    Protocol.where("status = ? AND affiliation_id = ? AND title LIKE ?", num, user.affiliation_id, "%#{keyword}%").distinct
  end
  
  def self.search_admin(keyword, num)
    return Protocol.where(status: num) unless keyword
    Protocol.where("status = ? AND title LIKE ?", num, "%#{keyword}%").distinct
  end
end
