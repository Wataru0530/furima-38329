# README

##　usersテーブル

| Colum         | Type     | Option          |
|--------------------------------------------|
| nickname      | string   | null: false
| email         | string   | null: false
| encrypted     | string   | null: false
| name          | string   | null: false
| birth         | string   | null: false

##　productsテーブル

| Colum            | Type     | Option          |
|-----------------------------------------------|
| item name        | string   | null: false
| info             | text     | null: false
| category         | string   | null: false
| situation        | string   | null: false
| cost             | string   | null: false
| area             | string   | null: false
| days             | string   | null: false
| price            | integer  | null: false

## purchasesテーブル

| Colum            | Type     | Option          |
|-----------------------------------------------|
| cardinfo         | string   | null: false
| expiry           | string   | null: false
| securitycode     | string   | null: false

## sipping addressテーブル

| Colum            | Type     | Option          |
|-----------------------------------------------|
| code             | string   | null: false
| area             | string   | null: false
| city             | string   | null: false
| address          | string   | null: false
| building         | string   |
| phone            | string   | null: false
