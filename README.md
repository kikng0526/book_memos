# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプリケーション名

book_memo

# アプリケーション概要

・ユーザー登録機能（nickname, email, password)
・本投稿機能(image, text)
・コメント投稿機能(text)

# 趣旨
本の感想を共有できるアプリケションです。いいね機能も実装しており、より多くの人の心に響いた感想を数値で可視化することができます。
また、自分だけの感想を表示できるように実装しており、自分だけの本のメモ帳としても利用できます。

# er図

url: 

# テーブル設計
## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |

### Association

- has_many :books
- has_many :comments


## books テーブル

| Column      | Type       | Options                        |
| ----------  | ------     | ------------------------------ |
| name        | string     | null: false                    |
| text        | text       | null: false                    |
| category_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column      | Type       | Options                        |
| ----------  | ------     | ------------------------------ |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| book        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :book
