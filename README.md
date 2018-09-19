## Users Table

| Column | type | Options |
|---------------------|-------|--------|
| name | string | null:false |
| email | string | null:false |

## Post Table

| Column | type | Options |
|---------------------|-------|--------|
| text | text ||
| user_id | integer ||
| image | string ||


## Comment Table

| Column | type | Options |
|---------------------|-------|--------|
| user_id | integer ||
| post_id | integer ||
| text | integer ||
| Column | type ||
