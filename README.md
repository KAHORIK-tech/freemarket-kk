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