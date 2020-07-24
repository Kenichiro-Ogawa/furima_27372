class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]\z/
  validates :nickname, presence: true, uniqueness: {case_sensitive: true}
  validates :email, presence: true, uniqueness: {case_sensitive: true}
  validates :password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
end
