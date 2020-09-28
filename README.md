# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| first_name       | string | null: false |
| last_name        | string | null: false |
| first_name_kana  | string | null: false |
| last_name_kana   | string | null: false |
| password         | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :products
- has_many :addresses

## products テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| name            | string     | null: false                     |
| image           | string     | null: false                     |
| explanation     | text       | null: false                     |
| category_id     | integer    | null: false                     |
| derively_fee_id | integer    | null: false                     |
| status_id       | integer    | null: false                     |
| prefecture_id   | integer    | null: false                     |
| day_id         | integer    | null: false                     |
| price           | integer    | null: false                     |
| user            | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one    :address

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |

### Association

- has_one :purchase