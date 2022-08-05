# テーブル設計
postage = 送料
description = 説明
prefecture = 県

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false unique: true |
| encrypted_paddword | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_day          | date   | null: false              |

### Association

- has_many   :itemes  dependent: :destroy
- has_many   :orders  dependent: :destroy
- belongs_to :address dependent: :destroy
- belongs_to :card    dependent: :destroy

## items テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| name          | string  | null: false                    |
| description   | string  | null: false                    |
| status        | string  | null: false                    |
| shipping_days | string  | null: false                    |
| postage       | string  | null: false                    |
| price         | integer | null: false                    |
| prefecture_id | integer | null: false, foreign_key: true |
| category_id   | integer | null: false, foreign_key: true |
| user_id       | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :prefecture
- has_one :order

## adresses テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| family_name      | string  | null: false                    |
| first_name       | string  | null: false                    |
| family_name_kana | string  | null: false                    |
| first_name_kana  | string  | null: false                    |
| post_code        | string  | null: false                    |
| city             | string  | null: false                    |
| building_name    | string  |                                |
| phone_number     | string  | null: false                    |
| order_id         | integer | null: false, foreign_key: true |
| user_id          | integer | null: false, foreign_key: true |
| prefecture_id    | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to_active_hash :prefecture
- belongs_to :order

## orders テーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| item_id     | integer | null: false  foreign_key: true |
| user_id     | integer | null: false, foreign_key: true |
| adress_id   | integer | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :adress

## cards テーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| card_id     | integer | null: false                    |
| user_id     | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
