class Procedure < ApplicationRecord
  belongs_to :protocol

  validates :text, presence: true
  validates :position, presence: true
end
