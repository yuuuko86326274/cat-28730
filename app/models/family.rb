class Family < ApplicationRecord
  has_one :address
  belongs_to :cat
  belongs_to :personal
  belongs_to :trader

  with_options presence: true do
    validates :cat_id
    validates :personal_id
    validates :trader_id
  end
end
