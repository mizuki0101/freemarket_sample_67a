class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  POSTAL_CODE_VALID = /\A\d{3}-\d{4}\z/
  PHONE_VALIDATION = /\A\d{10,11}\z/

  validates :postnumber,  presence: true, length: {maximum: 100}, format: {with: POSTAL_CODE_VALID}
  validates :prefecture_id,   presence: true
  validates :city,  presence: true, length: {maximum: 50}
  validates :house_number,  presence: true, length: {maximum: 100}
  validates :send_family_name,           presence: true, length: {maximum: 30}
  validates :send_first_name,            presence: true, length: {maximum: 30}
  validates :send_family_name_kana,       presence: true, length: {maximum: 30}
  validates :send_first_name_kana,        presence: true, length: {maximum: 30}
  validates :phonenumber,           length: {maximum: 100}, format: {with: PHONE_VALIDATION}, allow_blank: true



end