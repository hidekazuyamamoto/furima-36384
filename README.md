## user

| column                  | type                  | option                                     |
|-------------------------|-----------------------|--------------------------------------------|
| nickname                | string                | null:false                                 |
| email                   | string                | null:false, unique: true                   |
| encrypted_password      | string                | null:false                                 |
| first_name              | string                | null:false                                 |
| first_name_kana         | string                | null:false                                 |
| last_name               | string                | null:false                                 |
| last_name_kana          | string                | null:false                                 |
| birthday                | date                  | null:false                                 |

### association
has_many :items
has_many :comments
has_many :purchased_logs

## item
| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| name                    | string                | null:false                    |
| explanation             | text                  | null:false                    |
| price                   | integer               | null:false                    |
| user                    | references            | null:false, foreign_key:true  |
| area_id                 | integer               | null:false                    |
| category_id             | integer               | null:false                    |
| status_id               | integer               | null:false                    |
| postage_id              | integer               | null:false                    |
| days_id                 | integer               | null:false                    |

### association
belongs_to :user
has_many :comments
has_many :purchased_log


## purchased_log

| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| user                    | references            | null:false, foreign_key:true  |
| item                    | references            | null:false, foreign_key:true  |

### association
belongs_to :user
belongs_to :item


## register

| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| purchased_log           | references            | null:false, foreign_key:true  |
| postal_code             | string                | null:false                    |
| city                    | string                | null:false                    |
| address                 | string                | null:false                    |
| building_name           | string                |                               |
| telephone_number        | string                | null:false                    |
| area_id                 | integer               | null:false                    |

### association
belongs_to :purchased_log

## comment

| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| comment                 | text                  | null:false                    |
| user                    | references            | null:false, foreign_key:true  |
| item                    | references            | null:false, foreign_key:true  |

### association
belongs_to :user
belongs_to :item
