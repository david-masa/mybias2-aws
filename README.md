## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false,unique:true|
|mail_adress|string|null:false,unique:true|
|password|string|null:false|

### Association
- has_many:genres,throgh:users_genres
- has_many:posts
- has_many:users_genres

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text||
|video|string||
|user_id|references|null:false,foreign_key:true|
|genre_id|references|null:false,foreign_key:true|

### Association
- belongs_to:user
- belongs_to:genre

## genresテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

### Association
- has_many:posts
- has_many:users_genres
- has_many:users,through:users_genres

## users_genresテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false,foreign_key:true|
|genre_id|integer|null:false,foreign_key:true|

### Association
- belongs_to:genre
- belongs_to:user