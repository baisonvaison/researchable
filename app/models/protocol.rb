class Protocol < ApplicationRecord
  belongs_to :user
  belongs_to :affiliation
  has_many :procedures
  has_many :experiments

  enum status: {base: 0, custom: 1, template: 2}

  # Constant for enum
  BASE = 0
  CUSTOM = 1
  TEMPLATE =2
end
