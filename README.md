# Archive.S

ご覧いただきありがとうございます。  
こちらは転職活動のためにポートフォリオとして作成した、  
webアプリケーションです。(2020/6/15作成開始~2020/7/12公開)  

このアプリケーションは競泳を中心とした水泳競技のトレーニングメニュー、大会記録の管理、保存を目的としたものです。  

Archive.Sというアプリケーション名は、その名の通り記録保管所という意味です。  
どの競技においても、トレーニングメニューは指導者・競技者の財産と言っても過言ではないと私は考えており、その大切な財産を失わず、誰かに引き継ぐために記録(アーカイブ)する場所を作りたい、そんな思いを込めてArchive.Sと名付けました。  

### 作成経緯
このアプリケーションのテーマは  
メニュー・大会記録管理の簡略化と情報の共有の２点です。  

私自身トレーニングメニューの管理の煩雑さを身をもって体験しているので、その管理を簡略化し  
情報の共有、自身の記録・状態の把握をしやすくすれば競技人口全体の  
レベルの底上げにつながると考えたのですが、作成者によって作成・管理方法は様々なので、エクセルやノートなどの作成方法方に関わらず、  
保存・管理が気軽にできるアプリケーションを目指しました。  

### 使用技術・環境
-使用言語・フレームワーク
  -Ruby(2.5.7)
  -RubyOnRails(5.2.4.3)
  -JavaScript
-環境
 -vagrant
 -AWS(EC2/EIP/RDS/S3)
 -puma
 -nginx
 -MySQL(5.5.62)
-ライブラリ
 -CSS
  -bootstrap(CSSフレームワーク)
 -JavaScript
  -JQuery
  -chartkick(チャート機能)
  -summernote(リッチテキストエディタ)
  -carrierwave(画像投稿)
  -lightbox2(画像拡大)
 -その他
  -kaminari(ページネーション)
  -devise(ログイン機能)
  -rubocop-airbnb(静的解析)

### ターゲットユーザ
水泳競技のコーチ、水泳競技者
(オープンウォーター、トライアスロンも含む)


## 設計書
er図  
https://drive.google.com/file/d/10_1ICXX3u9fdxNxC0gXFmqCLzMIAKnxd/view?usp=sharing

### 機能一覧
https://docs.google.com/spreadsheets/d/1a2_gdlJOAmjeKsuBNldaIFc3XP90_73EUEjmzU69-6o/edit#gid=1255680757


