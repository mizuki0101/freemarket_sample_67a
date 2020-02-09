class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one :address, dependent: :destroy
         has_many :products
         VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         PASSWORD_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
         PHONE_VALIDATION = /\A\d{10,11}\z/
         validates :email,                  uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
         validates :password,              presence: true, length: {minimum: 7, maximum: 128},    format: { with: PASSWORD_VALIDATION }
         validates :password_confirmation, presence: true
         validates :nickname,              presence: true, length: {maximum: 20}
         validates :family_name,           presence: true, length: {maximum: 30}
         validates :first_name,            presence: true, length: {maximum: 30}
         validates :family_name_kana,       presence: true, length: {maximum: 30}
         validates :first_name_kana,        presence: true, length: {maximum: 30}
         validates :phonenumber,           presence: true, length: {maximum: 100}, format: {with: PHONE_VALIDATION}
         validates :birth_year,            presence: true
         validates :birth_month,           presence: true
         validates :birth_date,            presence: true
end
