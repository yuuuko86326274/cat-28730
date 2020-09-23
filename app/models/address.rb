class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :family
  belongs_to_active_hash :area

  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
    validates :first_pkey, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナで入力して下さい。' }
    validates :last_pkey, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナで入力して下さい。' }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message:'は半角、ハイフンを入れて入力してください' }
    validates :area_id, numericality: { other_than: 0 }
    validates :city
    validates :address_num
    validates :tel, format: { with: /\A\d{11}\z/, message:'は半角、ハイフンなしで入力してください' }
    validates :birthday
    validates :family_id
  end
end