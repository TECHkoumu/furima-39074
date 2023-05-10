# テーブル設計

## usersテーブル

| Column             |  Type  |     Options |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true|
| password_digest    | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |


## Association
has_many :items
has_many :orders

## ユニーク制約の追加
`users`テーブルの`email`カラムにユニーク制約を追加する方法
1. マイグレーションファイルを作成
   ```ruby
   class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[6.1]
     def change
       add_index :users, :email, unique: true
     end
   end

## itemsテーブル

| Column             |  Type  |     Options |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| description        | text   | null: false |
| category           | integer | null: false, default: 0 |
| condition          | integer | null: false, default: 0 |
| postage            | integer | null: false, default: 0 |
| prefecture         | integer | null: false, default: 0 |
| preparation_day    | integer | null: false, default: 0 |
| price              | integer | null: false |
| seller_id          | integer | null: false, foreign_key: true|

## Association
belongs_to :seller, class_name: "User"
has_one :order

## ordersテーブル

| Column             |  Type  |     Options |
| ------------------ | ------ | ----------- |
| buyer_id           | integer | null: false, foreign_key: true |
| item_id            | integer | null: false, foreign_key: true |

## Association
belongs_to :buyer, class_name: "User"
belongs_to :item
has_one :address

## addressesテーブル

| Column             |  Type  |     Options |
| ------------------ | ------ | ----------- |
| order_id           | integer | null: false, foreign_key: true |
| postal_code        | string  | null: false |
| prefecture         | string  | null: false |
| city               | string  | null: false |
| street             | string  | null: false |
| building           | string  |             |
| phone_number       | string  | null: false |

## Association
belongs_to :order