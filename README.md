# README
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|phonenumber|integer|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_date|integer|null: false|
### Association
- has_many :addresses
- has_many :credits
- has_many :products

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
|size|string|-|
|name|string|null: false, index: true|
|description|text|null: false|
|delivery_date|references|null: false|
|status|references|null: false|
|prefecture_id|integer|null: false|
|category|references|null: false, foreign_key: true|
|bland_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
|saler_id|references|null: false, foreign_key: true|
### Association
- belongs_to :brand
- belongs_to :first_category
- has_many :product_images
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"

## addresses
|Column|Type|Options|
|------|----|-------|
|postnumber|integer|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|house_number|integer|null: false|
|building|string|
|user_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user

## credits
|Column|Type|Options|
|------|----|-------|
|card_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|
|customer_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user

## brands
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
### Association
- has_many :products

## images
|Column|Type|Options|
|------|----|-------|
|src|text|null: false|
|products|reference|null: false, foreign_key: true|
### Association
- belongs_to :product

## categoryies
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :products

## Status
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
## Delivery_date
|Column|Type|Options|
|------|----|-------|
|date|string|null: false|
### Association
- has_many :products