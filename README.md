# README

## users table

| Column   | Type   | Options                  |
| -------- | ------ | ------------------------ |
| name     | string | null: false, index: true |
| email    | string | null: false, index: true |
| password | string | null: false              |

### Association

- has_one :user-details
- has_many :products
- has_many :purchases
- has_many :comments

## user-details table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| family-name      | string     | null: false                    |
| first-name       | string     | null: false                    |
| family-name-kana | string     | null: false                    |
| first-name-kana  | string     | null: false                    |
| birth-year       | integer    | null: false                    |
| birth-month      | integer    | null: false                    |
| birth-date       | integer    | null: false                    |

### Association

- belongs_to :user

## products table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| image  | string     | null: false                    |
| name   | string     | null: false                    |
| info   | string     | null: false                    |

### Association

- belongs_to :user
- has_one :product-detail
- has_one :price
- has_one :delivery
- belongs_to :purchase
- has_many :comments

## product-details table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| product  | references | null: false, foreign_key: true |
| category | string     | null: false                    |
| status   | string     | null: false                    |

### Association

- belongs_to :product

## prices table

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| product          | references | null: false, foreign_key: true |
| price            | int        | null: false                    |
| sales-commission | int        |
| sales-profit     | int        |

### Association

- belongs_to :product

## deliveries table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| product       | references | null: false, foreign_key: true |
| delivery-fee  | string     | null: false                    |
| prefecture    | string     | null: false                    |
| delivery-time | string     | null: false                    |

### Association

- belongs_to :product

## purchases table

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| product      | references | null: false, foreign_key: true |
| credit-num   | integer    | null: false                    |
| credit-month | integer    | null: false                    |
| credit-date  | integer    | null: false                    |

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

## comments table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |
| text    | string     |

- belongs_to :user
- belongs_to :product
