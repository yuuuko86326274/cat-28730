class Family < ApplicationRecord
  has_one :address, dependent: :destroy
  belongs_to :cat
  belongs_to :personal
  belongs_to :trader
end
