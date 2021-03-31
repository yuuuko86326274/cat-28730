class Trader < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def self.guest
    find_or_create_by(email: 'guest@example.com') do |trader|
      trader.password = SecureRandom.urlsafe_base64
      trader.password_confirmation = trader.password
      trader.t_name = "ゲストユーザー"
      trader.t_postal_code = "111-1111"
      trader.area_id = "1"
      trader.t_city = "横浜市"
      trader.t_address_num = "下島町5丁目3ー３３"
      trader.t_tel = "01234567890"
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :families, dependent: :destroy
  has_many :cats, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to_active_hash :area

  with_options presence: true do
    validates :email
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, length: { minimum: 6 }
    validates :t_name
    validates :t_postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :area_id, numericality: { other_than: 0 }
    validates :t_city
    validates :t_address_num
    validates :t_tel, format: { with: /\A\d{11}\z/ }
  end
end
