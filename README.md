# テーブル設計

## usersテーブル

| Column             |  Type  |     Options |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_day          |  date  | null: false |


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
| category_id        | integer | null: false, default: 0 |
| condition_id       | integer | null: false, default: 0 |
| postage_id         | integer | null: false, default: 0 |
| prefecture_id      | integer | null: false, default: 0 |
| preparation_day_id | integer | null: false, default: 0 |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true|

## Association
belongs_to :user
has_one :order

## ordersテーブル

| Column             |  Type  |     Options |
| ------------------ | ------ | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## Association
belongs_to :user
belongs_to :item
has_one :address

## addressesテーブル

| Column             |  Type  |     Options |
| ------------------ | ------ | ----------- |
| order              | references | null: false, foreign_key: true |
| postal_code        | string  | null: false |
| prefecture_id      | integer  | null: false |
| city               | string  | null: false |
| street             | string  | null: false |
| building           | string  |             |
| phone_number       | string  | null: false |

## Association
belongs_to :order