class User < ApplicationRecord
  # has_one :personal#, optical: true

  validates :nickname, presence: true
end
