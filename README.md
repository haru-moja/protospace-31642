## users_テーブル

| Column | Type | Option |       
|--|--|--|
| email| string| NOT NULL|
| password| string| NOT NULL|
| name| string| NOT NULL|
| profile| text| NOT NULL|
| occupation| text|NOT NULL|
| position| text| NOT NULL|

### Association
- has_many : comments
- has_many : prototypes

<br>

## Prototypes_テーブル
| Column | Type | Option |       
|--|--|--|
| title| string| NOT NULL|
| catch_copy| text| NOT NULL|
| concept| text| NOT NULL|
| image| `ActiveStorage`で実装||
| user| references| null: false, foreign_key: true|

### Association
- has_many : comments
- belongs_to : user
<br>

## Comments_テーブル
| Column | Type | Option |       
|--|--|--|
|text| text| NOT NULL|
| user| references| null: false, foreign_key: true|
| prototype| references| null: false, foreign_key: true|
## association
- belongs_to :user
- belongs_to :prototype



