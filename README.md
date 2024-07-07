# Welcome to PC-shop Web Application 

# 技術スタック一覧
- [Docker](https://www.docker.com/ja-jp/) 仮想の実行環境作成アプリケーション
- [Ruby on Rails](https://rubyonrails.org/)　Webアプリケーションフレームワーク
- [使用教科書](https://www.oiax.jp/rails5book) 改訂4版 基礎Ruby on Rails

# 環境構築
[Docker](https://docs.docker.com/desktop/install/mac-install/)のインストールとサインインが完了している状態から始める。

<br>

### Step1 コンテナの作成
- ターミナルを開いてアプリケーション作成用のディレクトリに移動したら、以下のコマンドを用いてDocker用のディレクトリを作成、移動する。
```sh
mkdir docker
cd docker
```

- 以下の内容を以下の内容をDockerfileというファイル名でdockerディレクトリ内に保存する。

```sh
FROM ruby:3.1.3-bullseye

ENV LANG="C.UTF-8" \
    TZ="Asia/Tokyo" \
    RAILS_VERSION="7.0.4"

RUN apt-get update && apt-get install -y vim git less && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y sqlite3 && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get -y install build-essential && rm -rf /var/lib/apt/lists/*

RUN gem install rails --version "$RAILS_VERSION" -N

RUN gem update bundler

RUN git config --global init.defaultBranch main

EXPOSE 3000
```
- 以下のコマンドでDockerイメージを作成し、コンテナを起動
```sh
docker build -t pc-shop:2024 .
```

```sh
docker run -p 3000:3000 -v $(pwd)/rails:/var/www -w /var/www --name rails24 -d pc-shop:2024 tail -f /dev/null
```
> `pc-shop:2024`や`rails24`は変えてもok

>dockerディレクトリ下にrailsディレクトリが作成される

> `docker ps`でコンテナが起動しているか確認できる

<br>

### Step2 コンテナへのログイン
```ssh
docker exec -it rails24 bash
```
>コマンドプロンプトが`root@<CONTAINER-ID>:/var/www#`となる。
  
>コンテナからロクアウトする場合は`exit`

>コマンドプロンプトスタイルを変更しておくとよい。  
>`echo 'export PS1="\[\e[1;33m\]rails:\w \u\[\e[m\]# "' >> ~/.bashrc`    
>`source ~/.bashrc`

<br>

### Step3 Railsの確認
コンテナにログインした状態で`rails -v`　　

Rails 7.0.4のように7系のRailsがインストールされていることを想定している。

本来であれば、railsコマンドを用いてRailsアプリケーションを作成するが、今回はリポジトリからクローンするため、省略。

　この後の作業のために、`exit`、ログアウトしておく。

<br>

### Step4 以下のリポジトリーからソースコードを取得

[GitHub Repogitory](https://github.com/ne221248/Rails-application/) `https://github.com/ne221248/Rails-application/`

コンテナからログアウトした状態で実行
```sh
cd rails
git clone git@github.com:ne221248/Rails-application.git
```

もしくは、以下のコマンドを実行してください。

```sh
cd rails
gh repo clone ne221248/Rails-application
```
<br>

### Step5 ローカル開発環境をセットアップ
docker ディレクトリで実行

```sh
make setup
```

### Step6 アプリケーション起動

```sh
make run
```
アプリケーションを停止するには、バックグラウンド実行したため、`fg`コマンドでフォアグラウンドに移行し、Ctrl+Cキーを押す。

<br>

# How to use this application

