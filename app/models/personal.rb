class Personal < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def self.guest
    find_or_create_by(email: 'guest@example.com') do |personal|
      personal.nickname = "ゲストユーザー(飼いたい方)"
      personal.password = SecureRandom.urlsafe_base64
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :families, dependent: :destroy
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, length: { minimum: 6 }
  end
end
