***データベース***

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
| name | string |

  
___
    
***Herokuへのデプロイ方法***
  
1.herokuにログインする  
`$ heroku login`  

２.アセットプリコンパイル実行  
`$ rails assets:precompile RAILS_ENV=production`

3.コミットする  
`$ git add -A  `  
`$ git commit -m "コミットメッセージ"  `

4.herokuに新しいアプリケーションを作成  
`$ heroku create  `
    
5.Herokuにデプロイ  
`$ git push heroku master `
  
6.マイグレーションを行う  
`$ heroku run rails db:migrate `
