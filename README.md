# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| name_kana          | string | null: false |
| birthday           | string | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| explanation | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase 

##  purchasesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
_ has_one :shopping

##  shoppingテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| address      | string     | null: false                    |
| phone_number | integer    | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase