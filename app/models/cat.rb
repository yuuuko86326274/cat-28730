class Cat < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :trader
  has_one :family, dependent: :destroy
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

  validates :price, numericality: { greater_than_or_equal_to: 1000, less_than_or_equal_to: 50000, allow_blank: true }

  validate :image_type, :image_size, :image_length

  with_options presence: true do
    validates :c_name, length: { maximum: 40 }
    validates :c_text, length: { maximum: 1000 }
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

  private

  def image_type
    images.each do |image|
      unless image.blob.content_type.in?(%('image/jpeg image/png'))
        image.purge
        errors.add(:images, 'はjpegまたはpng形式でアップロードしてください')
      end
    end
  end

  def image_size
    images.each do |image|
      if image.blob.byte_size > 5.megabytes
        image.purge
        errors.add(:images, 'は1つのファイル5MB以内にしてください')
      end
    end
  end

  def image_length
    return unless images.length > 5

    image.purge
    errors.add(:images, 'は5枚以内にしてください')
  end

end
