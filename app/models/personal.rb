class Personal < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def self.guest
    find_or_create_by(email: 'guest@example.com') do |personal|
      personal.password = SecureRandom.urlsafe_base64
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :favorites
  has_many :families
  # belongs_to :user

  with_options presence: true do
    validates :email
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, length: { minimum: 6 }
  end
end
