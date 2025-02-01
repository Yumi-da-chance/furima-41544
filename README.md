# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| password           | string              | null: false, unique: true |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_date         | data                | null: false               |

### Association

* has_many :items
* has_many :records

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| image                               | string     | null: false                    |
| item_name                           | string     | null: false                    |
| item_information                    | text       | null: false                    |
| seller_name                         | references | null: false, foreign_key: true |
| category                            | string     | null: false                    |
| condition                           | string     | null: false                    |
| shipping_cost                       | string     | null: false                    |
| shipping_area                       | string     | null: false                    |
| shipping_days                       | string     | null: false                    |
| price                               | string     | null: false                    |
| commission                          | string     | null: false                    |
| profit  　　                        | string     | null: false                    |

### Association

- belongs_to :user
- has_one :record

## records table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| item             | references | null: false, foreign_key: true |
| customer-name    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping

## shipping table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| item            | references | null: false, foreign_key: true |
| price           | references | null: false, foreign_key: true |
| customer_name   | references | null: false, foreign_key: true |
| postal_code     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| address_line    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| tel             | string     | null: false                    |

### Association

- belongs_to :record
- belongs_to :user
