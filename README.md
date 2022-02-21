# テーブル設計

## Usersテーブル

|Column            |Type  |option                   |
|------------------|------|-------------------------|
|nickname          |string|null: false              |
|first_name        |string|null: false              |
|last_name         |string|null: false              |
|first_name(rubi)  |string|null: false              |
|last_name(rubi)   |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|birthday          |date  |null: false              |

## Itemsテーブル

|Column            |Type      |option                        |
|------------------|----------|------------------------------|
|name              |string    |null: false                   |
|category_id       |integer   |null: false                   |
|price             |integer   |null: false                   |
|quality_id        |integer   |null: false                   |
|prefectures_id    |integer   |null: false                   |
|delivery_charge_id|integer   |null: false                   |
|user              |references|null: false, foreign_key: true|
|posting_id        |integer   |null: false                   |

## Addressesテーブル

|Column        |Type      |option                        |
|--------------|----------|------------------------------|
|post_code     |string    |null: false                   |
|phone         |string    |null: false                   |
|user          |references|null: false, foreign_key: true|
|city          |string    |null: false                   |
|building      |string    |null: false                   |
|prefectures_id|integer   |null: false                   |
|bought_rec    |references|null: false, foreign_key: true|


## bought_recテーブル

|Column |Type      |option                        |
|-------|----------|------------------------------|
|user   |references|null: false, foreign_key: true|
|item   |references|null: false, foreign_ker: true|