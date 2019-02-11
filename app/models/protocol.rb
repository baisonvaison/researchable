class Protocol < ApplicationRecord
  belongs_to :user
  belongs_to :affiliation
  has_many :procedures, inverse_of: :protocol
  has_many :experiments

  accepts_nested_attributes_for :procedures, allow_destroy: true

  enum status: {base: 0, custom: 1, template: 2}

  # Constant for enum
  BASE = 0
  CUSTOM = 1
  TEMPLATE =2
end
