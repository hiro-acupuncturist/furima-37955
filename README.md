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
| deliveryaddress             | string     | deliveryaddress_id null: false |
| postcode                    | string     | null: false                    |
| municipalitids              | string     | null: false                    |
| address                     | string     | null: false                    |
| building                    | string     |                                |
| tel                         | string     | null: false                    |
| purchaserecord              | references | null: false , foreign_key: true|

### Association
- belongs_to :purchaserecord




## items テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| name                       | string     | null: false                    |
| instructions               | text       | null: false                    |
| deliveryaddress            | string     | deliveryaddress_id null: false |
| category                   | string     | category_id      null: false   |
| quality                    | string     | quality_id       null: false   |
| deliverycharg              | string     | deliverycharg_id null: false   |
| deliveryday                | string     | deliveryday_id   null: false   |
| price                      | integer    | null: false                    |
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
