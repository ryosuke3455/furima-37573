# テーブル設計

## Usersテーブル

|Column    |Type  |option            |
|----------|------|------------------|
|nickname  |string|null: false       |
|name      |string|null: false       |
|email     |string|null: false       |
|password  |string|null: false       |
|birthday  |string|null: false       |

## Itemsテーブル

|Column          |Type   |option      |
|----------------|-------|------------|
|name            |string |null: false |
|category        |string |null: false |
|price           |string |null: false |
|quality         |string |null: false |
|from            |string |null: false |
|delivery_charge |string |null: false |

## Addressテーブル

|Column   |Type    |option      |
|---------|--------|------------|
|post_code|string  |null: false |
|phone    |string  |null: false |
|address  |text    |null: false |