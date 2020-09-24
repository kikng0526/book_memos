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

book_memos

# url

デプロイ次第記述します。


# アプリケーション概要

本の感想を共有できるアプリケションです。いいね機能も実装しており、より多くの人の心に響いた感想を数値で可視化することができます。
また、マイページを実装しており自分が投稿した本を一覧で表示することができます。

・ユーザー登録機能（nickname, email, password)
・本投稿機能(image, text, category_id)
・コメント投稿機能(text, likes_count)
・いいね機能

# テスト用アカウント

Basic認証

ID: kikng0526
PASS: kaito0526

email:    aaa@aaa
password: aaaaa1

# er図

url: (https://gyazo.com/d49e7b3035684cdecb04e685be96eea7ur)


# 要件定義 ＆ 利用方法

## ユーザー管理機能

### 目的

ユーザーの情報を管理するため。

### 詳細

・ユーザーを新しく登録できる。
・ユーザー登録が完了している場合、ログインすることができる。
・ログアウトできる。

### ストーリー

ログインボタンを押し、必要な項目を記入することでユーザー登録することができます。
ユーザー登録をしている場合は、サインインボタンを押していただき、必要項目を記入して頂くことでサインインすることができます。
ログアウトボタンを押して頂くことでログアウトすることができます。


## 本投稿機能

### 目的

本の情報を保存するため。

### 詳細

・本の名前を登録することができる。
・本の画像を登録をすることができる。
・本のカテゴリーを登録することができる。

### ストーリー

トップページの検索欄で自分が検索したい本の名前を検索します。
該当する本がなかった場合、検索結果欄に「本が見つかりません。新しく追加しましょう！」と表示されます。この文字をクリックして頂くことで、本登録画面に遷移することができます。
必要な項目を記入して頂くことで、本を登録することができます。


## 本検索機能

### 目的

本の情報にアクセスするため。

### 詳細

・本の名前を検索することができる。
・曖昧検索をすることができる。

### ストーリー

「本の名前は？」の欄に検索したい本の名前（分かる範囲で結構です。）を検索して頂き、検索ボタンを押します。
本が登録済みの場合、「検索結果」欄に本の名前が表示されます。
登録されていない場合、「本が見つかりません。新しく追加しましょう！」と表示されるため、クリックすることで登録することができます。


## コメント投稿機能

### 目的

本の詳細ページにコメントできるようにするため。

### 詳細

・本の詳細ページでコメントすることができます。
・非同期通信でコメントを投稿することができます。
・コメントにいいねをすることができます。
・コメントを削除することができます。

### ストーリー

コメント投稿フォームにコメントを記入することで、非同期通信で投稿することができます。
ハートボタンを押して頂くことで、コメントにいいねをすることができます。
もう一度ハートボタンを押して頂くことで、いいねを解除することができます。
ゴミ箱アイコンを押して頂くことで、コメントを削除することができます。



## マイページ表示

### 目的

ユーザーのマイページを作成し、投稿した本、コメントを確認することができるよにするため。

### 詳細

・ユーザーが投稿した本の一覧を表示することができます。
・ユーザーが投稿したコメントを表示することができます。

### ストーリー

ヘッダーにある、ユーザーのニックネームをクリックして頂くことで、マイページに遷移することができます。


# 実装予定の機能

・コメントのいいね機能と削除機能の非同期通信実装

・マイページでのコメント一覧

# 実装した機能のGIFと説明

## サインイン、ログアウト機能

(https://gyazo.com/e66341c33d96a9f074c504c63ba98ab7)

## 本検索機能

(https://gyazo.com/0dd3b2567b661ab0d90400ae2672b56c)

## 本投稿機能

(https://gyazo.com/159cab7158aa58a5b7826949cefd99a9)


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
| likes_count | integer    |                                |

### Association

- belongs_to :user
- belongs_to :book

## likes テーブル

| Column      | Type       | Options                        |
| ----------  | ------     | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| comment     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :comment

