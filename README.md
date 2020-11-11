**データベース**

Userテーブル
|  カラム名  |  データ型  |
| ---- | ---- |
| name  | string |
| email | string |
| password_digest | string |

Taskテーブル
|  カラム名  |  データ型  |
| ---- | ---- |
| title  | string |
| content | text |
| priority | integer |
| status | integer |
| limit | date |

Labelテーブル
|  カラム名  |  データ型  |
| ---- | ---- |
| task_id | bigint |
