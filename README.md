# アプリケーション名
stock_list(開発中です)

# アプリケーション概要
非常食の賞味期限を管理できるアプリケーションです。

# URL
https://stock-list-8b54.onrender.com/

# テスト用アカウント
- Basic認証ID：stolis
- Basic認証パスワード：1111
- Eメール:test@mail.com
- パスワード:111111

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
[要件定義シート](https://docs.google.com/spreadsheets/d/1VezBw4C079t_eND6X3nUdX1-ezVCEolpK3-6eBdiPJE/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明
## トップページ
このアプリの概要と簡単な説明文を記載しています。  
[![Image from Gyazo](https://i.gyazo.com/4e5a5a3041e571b24bcf70bcfa4c9f59.gif)](https://gyazo.com/4e5a5a3041e571b24bcf70bcfa4c9f59)

## ユーザー管理機能
トップページのヘッダーから移動できます。
- 新規登録ページ
ユーザー名、メールアドレス、パスワードを入力して登録します。  
[![Image from Gyazo](https://i.gyazo.com/97b381265f2386905da4d1404dc5e5c0.png)](https://gyazo.com/97b381265f2386905da4d1404dc5e5c0)

- ログインページ
登録したメールアドレス、パスワードを入力するとログインできます。  
[![Image from Gyazo](https://i.gyazo.com/f09228015ccf9e8c70c6844b31682d44.png)](https://gyazo.com/f09228015ccf9e8c70c6844b31682d44)

- ログイン後、在庫一覧と買い物リストの一覧が表示されます
[![Image from Gyazo](https://i.gyazo.com/6120c59bed7276417c0627c21811a5c8.png)](https://gyazo.com/6120c59bed7276417c0627c21811a5c8)

## 非常食管理機能
- 在庫一覧の表示
登録した非常食の一覧です。賞味期限までのカウントダウンも表示しています。7日前になると文字が赤く表示されます。  
※renderの仕様上、本番環境では一定時間経つと画像のリンクが切れます。解消のため勉強中
[![Image from Gyazo](https://i.gyazo.com/3b0ae073afc6e94c8b909e7f4171ce86.png)](https://gyazo.com/3b0ae073afc6e94c8b909e7f4171ce86)

- 投稿機能
非常食の商品名、備考欄、タグ、賞味期限、写真を入力して登録できます。
[![Image from Gyazo](https://i.gyazo.com/0bba4813dc6d08f59e1fba5eaa0db6d8.png)](https://gyazo.com/0bba4813dc6d08f59e1fba5eaa0db6d8)

- 一覧ページにある編集ボタンをクリックすると編集可能です。また消費後は削除ボタンをクリックすると削除できます。

- 右上の検索フォームにて「商品名」か「#タグ」で検索することが可能です。
[![Image from Gyazo](https://i.gyazo.com/0a1ec0b966716f8648deb020ddaf1dc1.png)](https://gyazo.com/0a1ec0b966716f8648deb020ddaf1dc1)

## 買い物リスト機能
- 在庫一覧の表示
消費した非常食を買い物リストとしてメモできる機能です。シンプルで見やすさを意識しました。  
[![Image from Gyazo](https://i.gyazo.com/ba3222472ce2eba679deaf02015da840.png)](https://gyazo.com/ba3222472ce2eba679deaf02015da840)

- 投稿機能
非常食の商品名、備考欄を入力して登録できます。  
[![Image from Gyazo](https://i.gyazo.com/7fdce9ddb857cfb6e21a7b9942ec0774.png)](https://gyazo.com/7fdce9ddb857cfb6e21a7b9942ec0774)

- 一覧ページの編集ボタンをクリックすると編集可能です。また消費後は削除ボタンをクリックすると削除できます。

## メール通知機能
登録した非常食の賞味期限が切れる1ヶ月、1週間前、当日それぞれ通知します。  
whenever、rakeタスク、Gmail APIを用いて実装しました。
※開発環境ではletter openerで動作を確認しました。
※本番環境であるrenderの仕様上、wheneverは使えないため、解消に向けて勉強中。
[![Image from Gyazo](https://i.gyazo.com/648b74e75f967ff87f56d4e5e0fca6d1.png)](https://gyazo.com/648b74e75f967ff87f56d4e5e0fca6d1)

# データベース設計
![ER(stolis)](https://github.com/1682123/stock_list/assets/129637236/13623f1c-ce00-4e7d-a91c-d983a677a7f0)

# 画面遷移図
<img width="3780" alt="stock_list画面変遷図" src="https://github.com/1682123/stock_list/assets/129637236/c40de572-b7af-473b-bc26-a549a6027552">

# 開発環境
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- MySQL
- Github
- bootstrap
- Visual Studio Code

# ローカルでの動作方法
1. git clone https://github.com/1682123/stock_list.git
1. cd stock_list
1. bundle install
1. yarn install
1. rails db:create
1. rails db:migrate
1. rails s

# 工夫したポイント
工夫した点は以下になります。  
まず１点目は、在庫一覧に非常食を写真付きで登録することにより、一目でどのような非常食があるのかをわかりやすくしました。  
また、タグを付けることによって整理、検索しやすくなると考え、登録の際にタグを複数入力できるようになっています。  
2点目は、賞味期限が切れる１週間前はカウントダウンの文字を赤く表示し目立たせたことです。  
3点目は、点目は、買い物リストを実装したことです。賞味期限の近い非常食を日常の中で消費し、消費した分を追加するというローリングストック法があります。在庫一覧から消費した非常食を削除した後、すぐ買い物リストとして記録できるようにしました。  
4点目は、アプリケーションに登録した非常食の賞味期限が近くなった時にメールで通知する機能を実装しました。期限より１ヶ月前と１週間前、当時の3回通知することにより、早めの消費を促すのが狙いです。  
5点目はBootstrapを用いてレスポンシブデザインにも対応させたことです。PCを持ち歩いて実際の非常食を在庫確認することはないと考え、スマートフォンからも登録しやすいようにしました。  
[![Image from Gyazo](https://i.gyazo.com/6bade6845c09fb6eed9498f6933b33aa.gif)](https://gyazo.com/6bade6845c09fb6eed9498f6933b33aa)
[![Image from Gyazo](https://i.gyazo.com/0c6944c1fafabf6b462cae19bd10897f.gif)](https://gyazo.com/0c6944c1fafabf6b462cae19bd10897f)