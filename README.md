# README

## users table

| Column           | Type   | Options                  |
| ---------------- | ------ | ------------------------ |
| nickname         | string | null: false, index: true |
| email            | string | null: false, index: true |
| password         | string | null: false              |
| family_name      | string | null: false              |
| first_name       | string | null: false              |
| family_name_kana | string | null: false              |
| first_name_kana  | string | null: false              |
| birthday         | date   | null: false              |

### Association

- has_many :items
- has_many :purchases
- has_many :comments

## items table

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| info          | string     | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| price         | int        | null: false                    |
| delivery_fee  | string     | null: false                    |
| prefecture    | string     | null: false                    |
| delivery_time | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :purchase
- has_many :comments

## purchases table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :delivery_destination

## delivery_destinations table

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| purchase    | references | null: false, foreign_key: true |
| postal_code | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| street      | string     | null: false                    |
| building    | string     | null: false                    |
| phone       | integer    | null: false                    |

### Associations

- belongs_to :purchase

## comments table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
| text   | string     |

- belongs_to :user
- belongs_to :item
