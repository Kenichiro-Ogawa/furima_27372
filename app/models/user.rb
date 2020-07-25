class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}\z/.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :email, uniqueness: { case_sensitive: true }
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :family_name, format: { with: VALID_NAME_REGEX }
    validates :first_name, format: { with: VALID_NAME_REGEX }
    validates :family_name_kana, format: { with: VALID_KANA_REGEX }
    validates :first_name_kana, format: { with: VALID_KANA_REGEX }
    validates :birthday, presence: true
  end
end
