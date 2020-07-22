# README

## users table

| Column           | Type    | Options                  |
| ---------------- | ------- | ------------------------ |
| name             | string  | null: false, index: true |
| email            | string  | null: false, index: true |
| password         | string  | null: false              |
| family-name      | string  | null: false              |
| first-name       | string  | null: false              |
| family-name-kana | string  | null: false              |
| first-name-kana  | string  | null: false              |
| birth-year       | integer | null: false              |
| birth-month      | integer | null: false              |
| birth-date       | integer | null: false              |

### Association

- has_many :products
- has_many :purchases
- has_many :comments

## products table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| info          | string     | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| price         | int        | null: false                    |
| delivery-fee  | string     | null: false                    |
| prefecture    | string     | null: false                    |
| delivery-time | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :purchase
- has_one :delivery-destination
- has_many :comments

## purchases table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :product
- has_one :delivery-destination

## delivery-destinations table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| purchase    | references | null: false, foreign_key: true |
| postal-code | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| street      | string     | null: false                    |
| building    | string     | null: false                    |
| phone       | integer    | null: false                    |

### Associations

- belongs_to :purchase
- belongs_to :product

## comments table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |
| text    | string     |

- belongs_to :user
- belongs_to :product
