# TITLE
FurimaKK

# DESCRIPTION
  マイページやプロフィールなどをユーザーが自分で手軽なカスタマイズができる、
  実際のフリーマーケットにより近づけたアプリを作りたいと考え、作成しました。

# 開発環境（予定）
- Ruby
- Ruby on Rails
- MySQL
- Github
- AWS
- Visual Studio Code

# アプリ機能（実装予定）
### 1.ユーザー登録
  アプリの利用にはユーザー登録を必要とします。メールアドレスでの登録の他、APIを利用しての登録も可能にする予定です。

### 2.マイページ
  各ユーザーの個人ページです。プロフィールの作成、背景などの仕様変更を可能とする予定です。

### 3.商品の出品
  商品の情報を登録して出品する事ができるようにします。

### 4.商品の検索
  商品をカテゴリー、もしくはキーワードで検索する事ができます。
  全商品を登録した日付順に並べてみることもできます。

### 5.商品の詳細表示
  出品されている商品を選択すると詳細情報が表示されます。

### 6.商品の買取
  他のユーザーが出品した商品の詳細情報ページから、商品を買い取る事ができます。

### 7.お気に入り機能
  気に入った商品に「いいね」をつけたり、また見に行きたいユーザーを登録して「お気に入り」として管理する事ができます。


# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null: false, unique: true, index: true|
|email|string|null: false, unique: true, index: true|
|password|string|null: false, unique: true|

### Association
- has_many :items
- has_one :profile
- has_many :cards
- has_many :favorites
- has_many :likes
- has_many :goods
- has_many :tradings


## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key :true|
|prefecture_id|references|foreign_key :true|
|introduction|text||
|image|string||

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture


## cardsテーブル
|Column|Type|Options|
|------|----|-------|

### Association
- belongs_to :user


## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|seller|references|foreign_key :true|
|buyer|references|foreign_key :true|

### Association
- has_many :seller, class:user
- has_many :buyer, class:user


## goodsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|introduction|text|null :false|
|category_id|references|null :false, foreign_key :true|
|prefecture_id|references|foreign_key :true, null :false|
|charge_id|references|foreign_key :true, null :false|
|shipping_method_id|references|null :false, foreign_key :true|
|price|integer|null :false|
|seller|references|foreign_key :true, class:user|

### Association
- has_many :images
- belongs_to :seller,class:user
- has_one :buyer, class:user
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images
- extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :charge
- belongs_to_active_hash :shipping_method


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|

### Association
belongs_to :good


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key:true|
|good|references|foreign_key:true|

### Association
belongs_to :item
belongs_to :user


## tradingsテーブル
|Column|Type|Options|
|------|----|-------|
|buyer|references|foreign_key:true|
|good|references|foreign_key:true|

### Association
belongs_to :buyer, class:user
belongs_to :good