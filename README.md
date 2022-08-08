# テーブル設計
postage = 送料
description = 説明
prefecture = 県
municipalities = 市区町村

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

- has_many   :items
- has_many   :orders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| price           | integer    | null: false                    |
| shipping_day_id | integer    | null: false, foreign_key: true |
| postage_id      | integer    | null: false, foreign_key: true |
| status_id       | integer    | null: false, foreign_key: true |
| prefecture_id   | integer    | null: false, foreign_key: true |
| category_id     | integer    | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to_active_hash :shipping_day
- belongs_to_active_hash :postage
- belongs_to_active_hash :status
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category
- has_one :order

## adresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| municipalities   | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |
| prefecture_id    | integer    | null: false, foreign_key: true |

### Association

- belongs_to :order

## orders テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| item     | references | null: false  foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :adress
