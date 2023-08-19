# アプリケーション名
stock_list(開発中です)

# アプリケーション概要
非常食の賞味期限を管理できるアプリケーションです。

# URL
https://stock-list-8b54.onrender.com/

# BASIC認証
- ユーザー名：stolis
- パスワード：1111

# テスト用アカウント
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
- 賞味期限を管理する：非常食管理機能 
- 非常食を検索しやすくする：タグ機能 
- 各ユーザーごとで非常食管理できるようにする：ユーザー管理機能
- 期限切れる前に通知：メール通知 
- ローリングストックできるよう消費後の非常食の追加：買い物リスト  

[要件定義書](https://docs.google.com/spreadsheets/d/1VezBw4C079t_eND6X3nUdX1-ezVCEolpK3-6eBdiPJE/edit#gid=982722306)

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

# 実装予定の機能
- メール通知機能

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

# 工夫したポイント
工夫した点は以下になります。  
まず１点目は、在庫一覧に非常食を写真付きで登録することにより、一目でどのような非常食があるのかをわかりやすくしました。  
また、タグを付けることによって整理、検索しやすくなると考え、登録の際にタグを複数入力できるようになっています。（検索機能はこれから実装予定）  
2点目は、賞味期限が切れる１週間前はカウントダウンの文字を赤く表示し目立たせたことです。  
3点目は、点目は、買い物リストを実装したことです。賞味期限の近い非常食を日常の中で消費し、消費した分を追加するというローリングストック法があります。在庫一覧から消費した非常食を削除した後、すぐ買い物リストとして記録できるようにしました。  