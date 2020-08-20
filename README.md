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



# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| --------      | ------  | ----------- |
| email         | string  | null: false |
| password      | string  | null: false |
| nickname      | string  | null: false |
| name          | string  | null: false |
| name_kana     | string  | null: false |
| date_of_birth | integer | null: false |

### Association
- has_many :items
- has_many :comments
- has_one :order


## items テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| image            | string  | null: false |
| item_name        | string  | null: false |
| item_explanation | string  | null: false |
| genre            | string  | null: false |
| status           | string  | null: false |
| delivery_fee     | string  | null: false |
| prefecture       | string  | null: false |
| delivery_days    | string  | null: false |
| price            | integer | null: false |
| user_id          | integer | null: false |

### Association
- belongs_to :user
- has_one :order
- has_many :comments


## comments テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| comment         | text     | null: false |
| item_id         | integer  | null: false |
| user_id         | integer  | null: false |

### Association
- belongs_to :user
- belongs_to :item


## orders テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| buy_item         | string  | null: false |
| buyer            | string  | null: false |
| billing          | string  | null: false |
| shipping_address | string  | null: false |
| user_id          | string  | null: false |
| item_id          | integer | null: false |

### Association
- belongs_to :user
- belongs_to :item