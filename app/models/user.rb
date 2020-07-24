class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]\z/
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGEX = /\A([ァ-ン]|ー)\z/

  with_options presence: true do
    validates :nickname, uniqueness: {case_sensitive: true}
    validates :email, uniqueness: {case_sensitive: true}
    validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
    validates :family_name, format: { with: VALID_NAME_REGEX }
    validates :first_name, format: { with: VALID_NAME_REGEX }
    validates :family_name_kana, format: { with: VALID_KANA_REGEX }
    validates :first_name_kana, format: { with: VALID_KANA_REGEX }
    validates :birthday, presence: true
  end

end
