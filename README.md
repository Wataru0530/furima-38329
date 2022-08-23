# README

##　usersテーブル

| Colum              | Type     | Option                    |
|-----------------------------------------------------------|
| nickname           | string   | null: false
| email              | string   | null: false, unique: true
| encrypted_password | string   | null: false
| firstname          | string   | null: false
| lastname           | string   | null: false
| firstnamekana      | string   | null: false
| lastnamekana       | string   | null: false
| birth              | date     | null: false

## Association

- has_many :products
- has_many :purchases 


##　productsテーブル

| Colum            | Type       | Option                        |
|---------------------------------------------------------------|
| item_name        | string     | null: false
| info             | text       | null: false
| category_id      | integer    | null: false
| situation_id     | integer    | null: false
| cost_id          | integer    | null: false
| area_id          | integer    | null: false
| day_id           | integer    | null: false
| price            | integer    | null: false
| user             | references | null: false, foreign_key: true


## Association

- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Colum            | Type     | Option                          |
|---------------------------------------------------------------|
| product          | references | null: false, foreign_key: true
| user             | references | null: false, foreign_key: true

## Association

- belongs_to :user
- has_one :address
- belongs_to :product

## addressesテーブル

| Colum            | Type       | Option                        |
|---------------------------------------------------------------|
| code             | string     | null: false
| area_id          | integer    | null: false
| city             | string     | null: false
| address          | string     | null: false
| building         | string     |
| phone            | string     | null: false
| purchase         | references | null: false, foreign_key: true


## Association

- belongs_to :purchase
