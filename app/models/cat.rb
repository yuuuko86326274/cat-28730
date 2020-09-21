class Cat < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :trader
  # has_one :family
  has_many_attached :images
  # has_one :favorite
  belongs_to_active_hash :breed
  belongs_to_active_hash :ope
  belongs_to_active_hash :sex
  belongs_to_active_hash :age
  belongs_to_active_hash :hair_length
  belongs_to_active_hash :color
  belongs_to_active_hash :how_many
  belongs_to_active_hash :eye_color
  belongs_to_active_hash :character
  belongs_to_active_hash :fleas
  belongs_to_active_hash :veccine
  belongs_to_active_hash :kuchu
  belongs_to_active_hash :single
  belongs_to_active_hash :senior

  with_options presence: true do
    validates :c_name
    validates :c_text
    validates :ope_id
    validates :sex_id
    validates :age_id
    validates :character_id
    validates :fleas_id
    validates :veccine_id
    validates :kuchu_id
    validates :trader_id
  end

  with_options numericality: { other_than: 0 } do
    validates :ope_id
    validates :sex_id
    validates :age_id
    validates :character_id
    validates :fleas_id
    validates :veccine_id
    validates :kuchu_id
  end
end
