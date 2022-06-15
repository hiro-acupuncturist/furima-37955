# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users　テーブル

| Column                           | Type        | Options                   |
| -------------------------------- | ----------- | ------------------------- |
| nickname                         | string      | null: false , unique: true|
| email                            | string      | null: false               |
| encrypted_password               | string      | null: false               |
| first_name                       | string      | null: false               |
| last_name                        | string      | null: false               |
| first_name_kana                  | string      | null: false               |
| last_name_kana                   | string      | null: false               |
| date_of_birth                    | date        | null: false               |

### Association
- has_many :items
- has_many :purchaserecords




## delivery テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| deliveryaddress_id          | integer    | null: false                    | 配送先住所
| postcode                    | string     | null: false                    | 郵便番号
| municipalitids              | string     | null: false                    | 市区町村
| address                     | string     | null: false                    | 番地
| building                    | string     |                                | 建物名
| tel                         | string     | null: false                    | 電話番号
| purchaserecord              | references | null: false , foreign_key: true| 購入記録

### Association
- belongs_to :purchaserecord




## items テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| name                       | string     | null: false                    |
| instructions               | text       | null: false                    |
| price                      | integer    | null: false                    |
| deliveryaddress_id         | integer    | null: false                    |
| category_id                | integer    | null: false                    |
| quality_id                 | integer    | null: false                    |
| deliverycharg_id           | integer    | null: false                    |
| deliveryday_id             | integer    | null: false                    |
| user                       | references | null: false , foreign_key: true|

### Association  
- belongs_to :user
- has_one :purchaserecord




## purchaserecord テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| user                       | references | null: false , foreign_key: true|
| item                       | references | null: false , foreign_key: true|

### Association
- belongs_to :user
- has_one    :delivery
- belongs_to :item
