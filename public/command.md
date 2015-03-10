#１．Dropboxのインストール
Ubuntu Software CenterからDropboxを検索し、一覧の結果からインストールします。

#２．Rubyのインストール
・環境の準備、最新ものを確認します。下記の２つコマンドでTerminalにコピーして実行しましょう。

```
sudo apt -get update

sudo apt -get install git -core curl zlib1g -dev build -essential libssl -dev libreadline -dev libyaml -dev libsqlite3 -dev sqlite3 libxml2 -dev libxslt1 -dev libcurl4 -openssl -dev python -software -properties
```
・rvm をインストールします。順番に下記のコマンドで実行しましょう。

```
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
rvm install 2.1.2
rvm use 2.1.2 --default
ruby -v

```
・Rubygemsのインストールの際、スピードを撮れる為Gemのドキュメントが要らないのでriを除外します：
`echo "gem: --no-ri --no-rdoc" > ~/.gemrc`

# ３．Railsのインストール
・Railsのインストール前にNodeJSをインストールします：

```
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
```
・Railsをインストール
`gem install rails`

・Railsのインストールが終了したらバージョンを確認します
`rails -v`
<!-- # Rails 4.1.1 -->

#４．Postgresqlをインストール
`$ sudo apt-getinstall postgresql postgresql-client libpq-dev`

・Pgのインストールが完了しましたら、PgへLoginしてみます：
`$ sudo-u postgres psql`
注意：\ｑを打ったらplsqlを完了します

・Plsql環境に下記のコマンド実行してみます
`SELECT*FROM pg_user;`
・結果は下記の例の場合があります：
USENAME　USESYS　IDUSECREATEDB　USESUPER　USECATUPD　PASSWD　VALUNTIL　USECONFIG　
postgres 10         t                           t               t           　********
(1 row)

・データベースユーザを作成
`$ sudo -u postgres createuser yayoi -s`
`ALTER USER yayoi CREATEUSER CREATEDB;`

・ユーザのパスワードの変更
`sudo  -u postgres psql`
`postgres = # \password yayoi`

・データベースの作成

`CREATE DATABASE yayoi WITH ENCODING='UTF8' OWNER=yayoi CONNECTION LIMIT=25;`

・リモートでPGへのアクセス
pg_hbd.confファイルに下記のラインを追加（IPはアクセスしたいクライアンのIPです）
ubuntu: /etc/postgresql/9.3/main/pg_hba.conf

```
 vi  /var/lib/pgsql/data/pg_hba.conf
host    all         all         192.168.101.20/24    trust
```
・リスナーアドレスの変更、postgresql.confを編集
<!-- # grep listen /var/lib/pgsql/data/postgresql.conf -->
`listen_addresses = '*'`

・コマンドでデータベースをstart,stop

```
sudo launchctl start com.edb.launchd.postgresql-9.3
sudo launchctl stop com.edb.launchd.postgresql-9.3
or
sudo service postgresql restart
sudo service postgresql start
sudo service postgresql stop
```

・Gem pg install (for MAC OSX)
`gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.3/bin/pg_config`

#５．Railsの設定
・# Gemfileに下記の行を追加されます
`gem "pg"`
・ウエブフォルダはロカールにコピーします。例えば：/home/cmc/jpt
・terminalでのcdコマンドを使用し、jptフォルダに移動します：
$ cd /home/cmc/jpt
・今bundleを更新します
$ bundle install
・Startサーバ
`rails s`

#6.Database Tool Install
Navicatのインストール
ホームページで開いてLinuxの所にダウンロードリンクがあります：
www.navicat.com/download/navicat-premium

ダウンロードしたファイル名称は：
navicat110_premium_en.tar.gz

このファイルはLinuxでのArchiveトールはロカルに展開してください。
例えばこちらの場合：
/home/cmc/Application/navicat110_premium_en

start_navicatをTerninalにドラグ・ドロプしてインストールします：

`＄sudo '/home/cmc/Application/navicat110_premium_en/start_navicat'`

DBVisual install


#7.rake
```
rails generate controller Shozai index
rails g scaffold Person first_name:string last_name:string
rake db:migrate
```

rollback
`rake db:migrate:down VERSION=20100905201547`

Create a new migration and run rake db:migrate
`rails g migration change_table`

To overrite existing file user --force option
`rails g migration employer --force`

View router path in current web app
`rake routes`

Create a seeds.rb on db folder and write insert code to auto insert data to table
`rake db:seed`

#8.rails
`rails server -e production`

#9.To create a new Rails application to use PostgreSQL:
`$ rails new myapp --database=postgresql`
