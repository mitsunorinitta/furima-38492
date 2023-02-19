# README

## Usersテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| second_name      | string | null: false |
| first_name_kana  | string | null: false |
| second_name_kana | string | null: false |
| birth_day        | date   | null: false |

### Association
has_many :items
has_many :purchase_records


## Itemsテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| item_name        | string  | null: false |
| item_description | text    | null: false |
| item_category    | string  | null: false |
| item_condition   | string  | null: false |
| shipping_charges | string  | null: false |
| region_origin    | string  | null: false |
| days_ship        | string  | null: false |
| item_price       | integer | null: false |

### Association
belongs_to :user
has_one :purchase_record


## Purchase_recordテーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping_informations


## Shipping_informationsテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| post_code        | integer | null: false |
| prefectures      | string  | null: false |
| municipalities   | string  | null: false |
| house_number     | string  | null: false |
| building_name    | string  |             |
| telephone_number | integer | null: false |

### Association
belongs_to :purchase_record
