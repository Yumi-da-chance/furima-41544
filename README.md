# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false,              |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_date         | date                | null: false               |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options                               |
|-------------------------------------|------------|---------------------------------------|
| item_name                           | string     | null: false                           |
| item_information                    | text       | null: false                           |
| user                                | references | null: false, foreign_key: true        |
| category_id                         | integer     | null: false                           |
| condition_id                        | integer    | null: false                           |
| shipping_cost_id                    | integer    | null: false                           |
| prefecture_id                       | integer    | null: false                           |
| shipping_day_id                     | integer    | null: false                           |
| price                               | integer    | null: false                           |


### Association

- belongs_to :user
- has_one :order

## orders table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| order           | references | null: false, foreign_key: true |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address_line    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

### Association

- belongs_to :order
