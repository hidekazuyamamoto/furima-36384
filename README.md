## user

| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| nickname                | string                | nill:false                    |
| email                   | string                | nill:false                    |
| encrypted_password      | string                | nill:false                    |
| first_name              | string                | nill:false                    |
| last_name               | string                | nill:false                    |
| birthday                | date                  | nill:false                    |

### association
has_many :items
has_many :comments
has_many :purchased_log

## item
| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| name                    | string                | nill:false                    |
| explanation             | text                  | nill:false                    |
| price                   | integer               | nill:false                    |
| user_id                 | references            | nill:false, foreign_key:true  |
| area_id                 | integer               | nill:false                    |
| category_id             | integer               | nill:false                    |
| status_id               | integer               | nill:false                    |
| postage_id              | integer               | nill:false                    |
| days_id                 | integer               | nill:false                    |

### association
belongs_to :user
has_many :comments
belongs_to :area
belongs_to :category
belongs_to :status
belongs_to :postage
belongs_to :days

## purchased_log

| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| user_id                 | references            | nill:false, foreign_key:true  |
| items_id                | references            | nill:false, foreign_key:true  |

### association
belongs_to :user
belongs_to :item
has_one :register

## register

| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| purchased_log_id        | references            | nill:false, foreign_key:true  |
| postal_code             | integer               | nill:false                    |
| address                 | string                | nill:false                    |
| building_name           | string                | nill:false                    |
| telephone_number        | integer               | nill:false                    |
| area_id                 | integer               | nill:false                    |

### association
belongs_to :purchased_log
belongs_to :area

## comment

| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| comment                 | text                  | nill:false                    |
| user_id                 | references            | nill:false, foreign_key:true  |
| item_id                 | references            | nill:false, foreign_key:true  |

### association
belongs_to :user
belongs_to :item

## area
| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| area_id                 | integer               | nill:false                    |

### association
has_many :items
has_many :registers

## category
| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| category                | integer               | nill:false                    |

### association
has_many :items

## status
| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| status_id               | integer               | nill:false                    |

### association
has_many :items

## postage
| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| postage_id              | integer               | nill:false                    |

### association
has_many :items

## days
| column                  | type                  | option                        |
|-------------------------|-----------------------|-------------------------------|
| days_id                 | integer               | nill:false                    |

### association
has_many :items