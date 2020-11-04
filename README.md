# Archive.S
<img width="1431" alt="スクリーンショット 2020-11-02 21 08 30" src="https://user-images.githubusercontent.com/62235152/97936939-865b7880-1dc0-11eb-999f-bebbdc3d114b.png">

ご覧いただきありがとうございます。  
こちらは転職活動のためにポートフォリオとして作成した、  
webアプリケーションです。

このアプリケーションは競泳を中心とした水泳競技のトレーニングメニュー、大会記録の管理、保存を目的としたものです。  

Archive.Sというアプリケーション名は、その名の通り記録・保管所という意味です。  
どの競技においても、トレーニングメニューは指導者・競技者の財産と言っても過言ではないと私は考えています。    
その大切な財産を失わないように、誰かへ引き継ぐための記録・保管(アーカイブ)する場所を作りたい、そんな思いを込めてArchive.Sと名付けました。  



## 作成経緯
このアプリケーションのテーマは  
メニュー・大会記録管理の簡略化と情報の共有の２点です。  

私自身、トレーニングメニューの管理の煩雑さを身をもって体験しているので、その管理を簡略化し  
情報の共有、自身の記録・状態の把握をしやすくすれば競技人口全体の  
レベルの底上げにつながると考えたのですが、作成者によって作成・管理方法は様々なので、  
エクセルや手書きのノートなどの作成方法方に関わらずに保存・管理が気軽にできるアプリケーションを目指しました。  

## 主な利用シーン
日々のトレーニングメニューの作成・保存。  
大会の記録管理・保存。  
ラップタイムから記録の分析。  

###  主な機能
 - 検索機能(メニュー・ユーザー)
 - メニュー・ユーザー 一覧画面でのソート機能
 - グラフ化
 - 非同期によるブックマーク機能
 - ブックマーク数からのランキング
 - ジャンル別メニュー検索

### 使用技術・環境
- 使用言語・フレームワーク
  - Ruby(2.5.7)
  - RubyOnRails(5.2.4.3)
  - JavaScript

- 環境
  - vagrant
  - AWS(EC2/EIP/RDS/S3)
  - puma
  - nginx
  - MySQL(5.5.62)  

- ライブラリ
  - CSS
    - bootstrap(CSSフレームワーク)  

  - JavaScript
    - jQuery
    - chartkick(チャート機能)
    - summernote(リッチテキストエディタ)
    - carrierwave(画像投稿)
    - lightbox2(画像拡大)  

  - その他
    - kaminari(ページネーション)
    - devise(ログイン機能)
    - rubocop-airbnb(静的解析)
    



### スクリーンショット
ユーザーのマイページです。  
<img width="1240" alt="スクリーンショット 2020-08-31 10 48 49" src="https://user-images.githubusercontent.com/62235152/91676287-51416880-eb7a-11ea-892f-27f2053523a4.png">  
chartkickを使用し、投稿したトレーニングメニューからトータル距離を参照してグラフ化しています。  

ユーザーが投稿した大会に紐づいた記録を投稿。
<img width="1305" alt="スクリーンショット 2020-08-31 10 43 01" src="https://user-images.githubusercontent.com/62235152/91676304-5b636700-eb7a-11ea-9a13-d341ccf5bf63.png">  

メニューと同じく、投稿した大会・記録に紐づいたラップタイムを投稿、ラップの距離と記録をグラフ化しています。
<img width="1241" alt="スクリーンショット 2020-08-31 10 43 14" src="https://user-images.githubusercontent.com/62235152/91676301-59010d00-eb7a-11ea-8055-cf888b63c748.png">

レスポンシブ対応  
<img width="260" alt="スクリーンショット 2020-11-04 9 03 57" src="https://user-images.githubusercontent.com/62235152/98053768-b10b0700-1e7c-11eb-9a3a-c5fefaece914.png">
<img width="260" alt="スクリーンショット 2020-11-04 9 20 43" src="https://user-images.githubusercontent.com/62235152/98054700-08aa7200-1e7f-11eb-962f-ae5226c4fe08.png">
<img width="260" alt="スクリーンショット 2020-11-04 9 40 58" src="https://user-images.githubusercontent.com/62235152/98055893-dd755200-1e81-11eb-872c-73559f164a02.png">



## 設計書
er図  
https://drive.google.com/file/d/10_1ICXX3u9fdxNxC0gXFmqCLzMIAKnxd/view?usp=sharing

### 機能一覧
https://docs.google.com/spreadsheets/d/1a2_gdlJOAmjeKsuBNldaIFc3XP90_73EUEjmzU69-6o/edit#gid=1255680757

### インフラ構成図
<img width="606" alt="スクリーンショット 2020-11-04 9 58 02" src="https://user-images.githubusercontent.com/62235152/98056847-3f36bb80-1e84-11eb-9c76-f25999160425.png">

