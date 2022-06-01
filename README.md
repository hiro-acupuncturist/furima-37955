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
| date_of_birth                    | datetime    | null: false               |



### Association
- has_many :items
- has_many :purshaserecords

## delivery テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| deliveryaddress             | string     | null: false                    |
| postcode                    | string     | null: false                    |
| municipalitids              | string     | null: false                    |
| address                     | string     | null: false                    |
| building                    | string     |                                |
| tel                         | string     | null: false                    |
| purshaserecord              | references | null: false , foreign_key: true|


### Association
- belongs_to :purshaserecord

## items テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| name                       | string     | null: false                    |
| instructions               | text       | null: false                    |
| category                   | string     | null: false                    |
| quality                    | string     | null: false                    |
| deliverycharg              | string     | null: false                    |
| deliveryday                | string     | null: false                    |
| price                      | integer    | null: false                    |
| commission                 | integer    | null: false                    |
| profit                     | integer    | null: false                    |
| user                       | references | null: false , foreign_key: true|



### Association  
- has_one :delivery
- has_one :purshaserecord

## purshaserecord テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| user                       | references | null: false , foreign_key: true|
| item                       | references | null: false , foreign_key: true|

### Association
- belongs_to :user
- belongs_to :delivery
- belongs_to :item
