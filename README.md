# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| password           | string              | null: false, unique: true |
| name               | string              | null: false               |


### Association

* has_many :items
* has_many :records

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item_name                           | string     | null: false                    |
| price                               | string     | null: false                    |
| item_information                    | text       | null: false                    |
| seller_name                         | references | null: false, foreign_key: true |

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
- has_one :shipping

## shipping table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| address         | string     | null: false                    |
| tel             | string     | null: false                    |
| customer_name   | references | null: false, foreign_key: true |

### Association

- belongs_to :record
- belongs_to :user
