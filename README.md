# アプリケーション名
stock_list(開発中です)

# アプリケーション概要
非常食の賞味期限を管理できるアプリケーションです。

# URL
https://stock-list-8b54.onrender.com/

# テスト用アカウント
<details>
<summary>テスト用アカウント</summary>
Eメール:test@mail.com
パスワード:111111

</details>

# 利用方法
1. 上記のテスト用アカウントでログイン
1. トップページの上部のメニューリストから在庫一覧へ
1. 非常食登録ボタンをクリック
1. 非常食の情報を入力して投稿
確認後、ログアウト処理をお願いします。

# アプリケーションを作成した背景
水害などの災害のニュースが多い昨今、不定期でふと思い出した時に非常食の確認すると賞味期限がすでに切れているということがしばしばありました。  
非常食なのに、賞味期限切れによって使えなくなってしまう課題を解決するため、非常食の賞味期限を管理するアプリケーションを作成することにいたしました。

# 洗い出した要件
- 賞味期限を管理する：非常食管理機能 
- 非常食を検索しやすくする：タグ機能 
- 各ユーザーごとで非常食管理できるようにする：ユーザー管理機能
- 期限切れる前に通知：メール通知 
- ローリングストックできるよう消費後の非常食の追加：買い物リスト  
[要件定義書](https://docs.google.com/spreadsheets/d/1VezBw4C079t_eND6X3nUdX1-ezVCEolpK3-6eBdiPJE/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明
### ユーザー管理機能
トップページのヘッターから移動できます。
- 新規登録ページ
ユーザー名、メールアドレス、パスワードを入力して登録します。

- ログインページ
登録したメールアドレス、パスワードを入力するとログインできます。

### 非常食管理機能
ログイン後、在庫一覧と買い物リストの一覧が表示されます。
- 投稿機能
写真、非常食の名前、備考欄、タグを入力して登録できます。

- 一覧表示
登録した非常食の一覧が表示されます。
右上の検索フォームから商品名、タグを検索できます。

- 編集ボタンをクリックすると編集可能です

- 消費後は削除ボタンをクリックすると削除できます。

### メール通知機能
登録した非常食の賞味期限が切れる1ヶ月と1週間前に通知します。

### 買い物リスト
消費した非常食や追加したい非常食を登録できます。
- 投稿
商品名、備考欄を入力して登録できます。

- 編集
編集ボタンをクリックと編集できます。

- 削除
削除ボタンをクリックすると削除できます。

# 実装予定の機能
- LINEアカウントでログインできる機能
- LINEで賞味期限の通知

# データベース設計
![ER(stolis)](https://github.com/1682123/stock_list/assets/129637236/13623f1c-ce00-4e7d-a91c-d983a677a7f0)

# 画面遷移図
<img width="3780" alt="stock_list画面変遷図" src="https://github.com/1682123/stock_list/assets/129637236/c40de572-b7af-473b-bc26-a549a6027552">

# 開発環境
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- mySQL
- Github
- AWS
- bootstrap

# ローカルでの動作方法
1. bundle install
1. yarn install
1. rails db:create
1. rails db:migrate

# 工夫したポイント
工夫した点は4点あります。
まず１点目は、在庫一覧に非常食を写真付きで登録することにより、一目でどのような非常食があるのかをわかりやすくしました。また、タグを付けることによって整理、検索しやすくなると考え、登録の際にタグを複数入力できるようになっています。  
２点目は、アプリケーションに登録した非常食の賞味期限が近くなった時にメールで通知する機能を実装しました。期限より１ヶ月前と１週間前の２回通知することにより、早めの消費を促すのが狙いです。  
３点目は、買い物リストを実装したことです。賞味期限の近い非常食を日常の中で消費し、消費した分を追加するというローリングストック法があります。在庫一覧から消費した非常食を削除した後、すぐ買い物リストとして記録できるようにしました。  
4点目はレスポンシブデザインにしたことです。PCを持ち歩いて実際の非常食を在庫確認することはないと考え、スマートフォンから登録しやすいようにしました。  
