class Trader < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :families
  has_many :cats
  belongs_to_active_hash :area

  with_options presence: true do
    validates :email
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, length: { minimum: 6 }
    validates :t_name
    validates :t_postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id, numericality: { other_than: 0 }
    validates :t_city
    validates :t_address_num
    validates :t_tel, format: { with: /\A\d{11}\z/ }
  end
end
