class Comment < ApplicationRecord
  belongs_to :personal, optional: true
  belongs_to :trader, optional: true
  belongs_to :cat
end
