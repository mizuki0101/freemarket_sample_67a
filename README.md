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
|size|string|null: false|
|status|string|null: false|
|delivery_date|string|null: false|
|name|string|null: false, index: true|
|description|text|null: false|
|first_category_id|references|null: false, foreign_key: true|
|bland_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
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
|prefecture|string|null: false|
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

## product_images
|Column|Type|Options|
|------|----|-------|
|url|text|null: false|
|product_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :product

## first_categorys
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products