# EnergyFood

とある小さな中華料理店の日替わりランチを、Web上で注文するサービスです。

# 画面キャプチャ
![result](https://github.com/takuhase/energy-food/blob/media/screenshot_small_1.png)
![result](https://github.com/takuhase/energy-food/blob/media/screenshot_small_2.png)
![result](https://github.com/takuhase/energy-food/blob/media/screenshot_small_3.png)

# 技術一覧
### 使用言語/フレームワーク
* Ruby 2.5.3
* Rails 5.2.2
* Javascript(jQuery)
* HTML5/CSS

### 開発環境
* Docker
* docker-compose

### インフラ
* AWS(VPC/EC2/RDS/Route53)
* MySQL2

### その他 gems
* RSpec/Capybara(テスト)
* rubocop(コード解析)
* circleci(CI/CD)
* faker(本番ダミーデータ)
* FactoryBot(テストデータ)
* devise(認証)
* ActiveAdmin(管理者画面)
* counter_culture(いいね数集計/表示)
* will_paginate(ページネーション)
* pry(デバッグ)
* bullet(N+1検出)
* bootstrap4/Font Awesome(デザインテンプレート)
* rails-i18n/devise-i18n(日本語対応)

# 機能一覧
### ユーザー向け機能
- 料理注文
- 注文の変更/削除(前日の23:59まで可)
- 注文履歴表示
- 料理のお気に入り登録
- 注文明細のCSV出力
- 新規登録/ログイン/ログアウト
- ユーザー情報の編集

### 店員向け機能
- 注文一覧表示
- 注文明細のCSV出力
- 料理一覧表示/新規追加
- 日替わりメニュー(料理 + 日付の組み合わせ)の一覧表示/新規追加
- ログイン/ログアウト

### システム管理者向け機能
- ユーザー/店員のCRUD操作
- ログイン/ログアウト

# 使い方
###### 前提条件
DockerおよびDocker-composeがローカル環境にインストールされていること。
###### 1. リモートリポジトリをクローン
リポジトリを作成したいディレクトリ階層にて `git clone https://github.com/takuhase/energy-food.git` を実行。

###### 2.Dockerイメージのビルドとコンテナ起動
`docker-compose build`    
`docker-compose up`

###### 3. データベースの作成,マイグレーションとデータ投入
`docker-compose exec web rails db:create db:migrate db:seed`

###### 4. テスト実行
`docker-compose exec web rspec`

テストが全てパスしたら、http://localhost:3000/ にアクセスすることで利用可能となります。
