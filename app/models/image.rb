class Image < ApplicationRecord
    belongs_to :experiment, optional: true
end
