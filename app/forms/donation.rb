class Donation
  include ActiveModel::Model
  attr_accessor :token, :donation, :cat_id, :trader_id, :first_name, :last_name, :first_pkey, :last_pkey, :birthday, :postal_code, :area_id, :city, :address_num, :building_num, :tel, :family_id, :personal_id, :message

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
    # validates :family_id
    validates :cat_id
    validates :personal_id
    # validates :trader_id
    validates :message
    validates :donation
    validates :token
  end

  def save
    family = Family.create(message: message, donation: donation, cat_id: cat_id, trader_id: trader_id, personal_id: personal_id)
    Address.create( first_name: first_name, last_name: last_name, first_pkey: first_pkey, last_pkey: last_pkey, birthday: birthday, postal_code: postal_code, area_id: area_id, city: city, address_num: address_num, building_num: building_num, tel: tel, family_id: family_id )
  end
end
