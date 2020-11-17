![furima](https://user-images.githubusercontent.com/68574158/99410102-6c2fa780-2935-11eb-833b-774731b4b62f.jpg)


# furima app

### テックキャンプの最終課題にて作成したアプリケーションです。


## 本番環境URL

https://furima29728.herokuapp.com/


## テスト用アカウント

- Basic認証
  - user: mita
  - pass: 2018 

- 購入者用テストアカウント  
  - email: buyer_user@gmail.com
  -  pass: buyer1

  - 購入用カード情報
    - 番号：4242424242424242
    - 期限：3月 23年
    - セキュリティコード：123

- 出品者用テストアカウント
  - email: seller_user@gmail.com
  -  pass: seller1


## 機能紹介

- Bassic認証

- devise機能

- 商品出品機能

- 商品一覧表示機能

- 商品詳細表示機能

- 商品情報編集機能

- 商品削除機能

- 商品購入機能
  - クレジットカードによる購入(Payjp 外部API)


## その他工夫点

- 非同期処理
  - クレジットカード決済
  - 入力した金額の税込み表示を行う
 

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
- has_many :purchases

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
| day_id          | integer    | null: false                     |
| price           | integer    | null: false                     |
| user            | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one    :purchase

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

- belongs_to :purchase

## ER図

<img width="731" alt="er" src="https://user-images.githubusercontent.com/68574158/99410136-7651a600-2935-11eb-9b0e-8170252ebfe5.png">

## 開発環境

- PC
	- OS: Catalina 
  - バージョン: 10.15.6

- フロントエンド
  - HTML/CSS
  - JavaScript

- バックエンド
	- Ruby 2.6.5
  - rails 6.0.3.4

- Webサーバー
  - Nginx 1.18.0

- アプリケーションサーバー
  - Puma 4.3.6

- データベース
  - MySQL

- インフラ関連
  - heroku
  - AWS S3
  - Git GitHub