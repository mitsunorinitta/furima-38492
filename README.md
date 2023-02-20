# README

## Usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| second_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| second_name_kana   | string | null: false               |
| birth_day          | date   | null: false               |

### Association
has_many :items
has_many :purchase_records


## Itemsテーブル

| Column             | Type    | Options                           |
| ------------------ | ------- | --------------------------------- |
| item_name          | string  | null: false                       |
| item_description   | text    | null: false                       |
| item_category_id   | integer | null: false                       |
| item_condition_id  | integer | null: false                       |
| shipping_charge_id | integer | null: false                       |
| prefecture_id      | integer | null: false                       |
| days_ship_id       | integer | null: false                       |
| item_price         | integer | null: false                       |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase_record


## Purchase_recordsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping_information


## Shipping_informationsテーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| post_code        | string      | null: false                    |
| prefecture_id    | integer     | null: false                    |
| municipalities   | string      | null: false                    |
| house_number     | string      | null: false                    |
| building_name    | string      |                                |
| telephone_number | string      | null: false                    |
| purchase_record  | references  | null: false, foreign_key: true |

### Association
belongs_to :purchase_record
