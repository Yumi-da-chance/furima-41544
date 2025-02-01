# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false, unique: true |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_date         | date                | null: false               |

### Association

* has_many :items
* has_many :records

## items table

| Column                              | Type       | Options                               |
|-------------------------------------|------------|---------------------------------------|
| item_name                           | string     | null: false                           |
| item_information                    | text       | null: false                           |
| user                                | references | null: false, foreign_key: true        |
| category_id                         | integer     | null: false                           |
| condition_id                        | integer    | null: false                           |
| shipping_cost_id                    | integer    | null: false                           |
| shipping_area_id                    | integer    | null: false                           |
| shipping_days_i                     | integer    | null: false                           |
| price                               | integer    | null: false                           |


### Association

- belongs_to :user
- has_one :record

## records table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :shipping

## shipping table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| address_line    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

### Association

- belongs_to :record
- belongs_to :user
