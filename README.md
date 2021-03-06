# テーブル設計

## Usersテーブル

|Column            |Type  |option                   |
|------------------|------|-------------------------|
|nickname          |string|null: false              |
|first_name        |string|null: false              |
|last_name         |string|null: false              |
|first_name_kana   |string|null: false              |
|last_name_kana    |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|birthday          |date  |null: false              |

### Association
  .has_many :items, dependent: :destroy
  .has_many :bought_recs, dependent: :destroy


## Itemsテーブル

|Column            |Type      |option                        |
|------------------|----------|------------------------------|
|name              |string    |null: false                   |
|category_id       |integer   |null: false                   |
|price             |integer   |null: false                   |
|quality_id        |integer   |null: false                   |
|explanation       |text      |null: false                   |
|prefecture_id     |integer   |null: false                   |
|delivery_charge_id|integer   |null: false                   |
|user              |references|null: false, foreign_key: true|
|posting_id        |integer   |null: false                   |

### Association

  .belongs_to :user
  .has_one :bought_rec

## Addressesテーブル

|Column        |Type      |option                        |
|--------------|----------|------------------------------|
|post_code     |string    |null: false                   |
|phone         |string    |null: false                   |
|user          |references|null: false, foreign_key: true|
|city          |string    |null: false                   |
|address       |string    |null: false                   |
|building      |string    |                              |
|prefecture_id |integer   |null: false                   |
|bought_rec    |references|null: false, foreign_key: true|

### Association

  .belongs_to :bought_rec


## bought_recテーブル

|Column |Type      |option                        |
|-------|----------|------------------------------|
|user   |references|null: false, foreign_key: true|
|item   |references|null: false, foreign_ker: true|

### Association

  .has_one :address
  .belongs_to :item
  .belongs_to :user