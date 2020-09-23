# README

## application name
- 'cat-28730'

## url 

## ID/Pass
  | ID     |   admin           |
  | Pass   |   2222            |

## テスト用アカウント等
  # 飼育決定者用
  | メールアドレス   |    tttt@tttt    |
  | パスワード      |     67tttttt    |

  # 飼育決定者用カード情報
  | 番号              |     4242424242424242    |
  | 期限              |     12/24               |
  | セキュリティコード   |     123                |

  # 猫登録業者用
  | メールアドレス名    |     yyyy@yyyy            |
  | パスワード         |     67yyyyyy             |

## 利用方法 このアプリケーションの利用方法を説明しましょう。
  保護猫(cat)と猫を飼いたい人(user)のマッチングアプリです。
  保護団体や、個人(trader)が保護した猫を登録して、会員登録したユーザーが飼育決定した時、マッチング成功です。
  飼育決定者は寄付という形で任意でクレジット決済が出来ます。
  相性診断をする事で、マッチ度向上を目指します。

## 目指した課題解決	このアプリケーションを通じて、どのような人の、どのような課題を解決したかったかを書きましょう。
  # ペルソナ
  | 猫を飼いたい人               |
  | 猫が飼えるか不安のある人       |
  | 占い好きな人                 |
  | 猫の動画、画像で癒されたい人    |
  | 20から50代                  |

  # ペルソナの課題
  | 猫を飼いたいが飼えるか不安     |   占い形式で判断させる                  |
  | かわいい猫を飼いたい          |   たくさんの猫から選ぶ                  |
  | 動画で癒されたい             |   トップに表示の毎日更新される動画を見れる  |

## 洗い出した要件
  | 優先順位            | 機能             | 目的                            | 詳細                                                | ストーリー(ユースケース)                            |見積もり（所要時間）|
  |（高：3、中：2、低：1）| -----------------|--------------------------------|----------------------------------------------------|--------------------------------------------------|---------------| 
  |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | 3                  | 一覧表示          | catが一気に見れる	               | 一覧、トップページでそれぞれ表示                        | トップページで一覧表示	                                     | 24     |
  | 3                  | 詳細表示          | 気に入ったcatの情報詳細	          | 詳細、個体の詳細	                                   | トップページから詳細ページ、占い結果一覧から詳細ページ	           | 12     |
  | 3                  | 会員登録          | user登録	                       | deviseでのユーザー管理                                | ユーザー登録はお気に入りボタンからもしくは直接会員登録ページから   | 12     |
  | 1                  | お気に入り登録     | cat飼育決定前に保留	              | sessionを使用                                       | 詳細ページからお気に入りを登録できる                           | 24    |
  | 3                  | 猫登録	           | traderがcat情報を登録	          | 個体の登録                                           | 業者登録後、猫登録                                         | 12     |
  | 2                  | 猫飼育決定         | userが飼育決定しtraderと連絡をとる | 飼育決定、寄付機能                                    | 詳細ページから飼育決定ページ（寄付あり）                       | 24     |
  | 1                  | 検索（占い方式)     | 飼育したいcatを条件で探すため      | タグを用いた検索、session使用、マッチ度％出す、pjaxで猫占い| トップページから占いへ進む                                   | 48     |
  | 1                  | マイページ         | お気に入りcat表示                | マイページ詳細、登録内容表示、お気に入り猫表示             |会員詳細ページに会員情報、お気に入り猫表示                       | 12    |
  | 3                  | 猫登録業者マイページ | traderの管理と登録catが一覧表示   | 登録業者のみ猫登録                                     | 業者登録した後、マイページから猫登録                          | 24     |
  | 3                  | 猫編集            | catに修正があった時に編集          | 個体詳細から編集                                      | 個体を登録した業者のみ個体詳細ページから編集ボタンで編集          | 24    |
  | 3                  | 猫削除            | catが引き取られ済の場合削除        | 個体詳細から削除                                       | 個体を登録した業者のみ個体詳細ページから削除ボタンで削除          | 12    |


## 実装した機能についてのGIFと説明	実装した機能について、それぞれどのような特徴があるのか列挙しましょう。GIFを添えることで、イメージがしやすくなります。

## 実装予定の機能	洗い出した要件の中から、今後実装予定のものがあれば記述しましょう。


# テーブル設計
https://gyazo.com/7abbf07d4c995bfff7d046e6d0694f77
## users テーブル

| Column           | Type       | Option                   |
| ---------------- | ---------- | ------------------------ |
| nickname         | string     | null: false              |

### Association
- has_one :personal


##  traders テーブル

| Column           | Type       | Option                                 |
| ---------------- | ---------- | -------------------------------------- |
| email            | string     | null: false                            |
| password         | string     | null: false                            |
| t_name           | string     | null: false                            |
| t_postal_code    | string     | null: false                            |
| area_id          | integer    | null: false                            |
| t_city           | string     | null: false                            |
| t_address_num    | string     | null: false                            |
| t_building_num   | string     |                                        |
| t_tel            | string     | null: false                            |

### Association

- has_many :families
- has_many :cats
- belongs_to_active_hash :area


##  personals テーブル

| Column           | Type       | Option                        |
| ---------------- | ---------- | ----------------------------- |
| email            | string     | null: false                   |
| password         | string     | null: false                   |
| user             | references | null: false, forein_key: true |

### Association

- has_many :favorites
- has_many :families
- belongs_to :user


##  addresses テーブル

| Column           | Type       | Option                                 |
| ---------------- | ---------- | -------------------------------------- |
| postal_code      | string     | null: false                            |
| area_id          | integer    | null: false                            |
| city             | string     | null: false                            |
| address_num      | string     | null: false                            |
| building_num     | string     |                                        |
| tel              | string     | null: false                            |
| first_name       | string     | null: false                            |
| last_name        | string     | null: false                            |
| first_pkey       | string     | null: false                            |
| last_pkey        | string     | null: false                            |
| birthday         | date       | null: false                            |
| family           | references | null: false, forein_key: true          |

### Association

- belongs_to :family
- belongs_to_active_hash :area


##  cats テーブル

| Column              | Type       | Option                                 |
| ------------------- | ---------- | -------------------------------------- |
| c_images            | string     | null: false                            |
| c_name              | string     | null: false                            |
| c_text              | text       | null: false                            |
| breed_id            | integer    |                                        |
| ope_id              | integer    | null: false                            |
| sex__id             | integer    | null: false                            |
| age__id             | integer    | null: false                            |
| hair_length_id      | integer    |                                        |
| color_id            | integer    |                                        |
| how_many_id         | integer    |                                        |
| eye_color_id        | integer    |                                        |
| character_id        | integer    | null: false                            |
| fleas_id            | integer    | null: false                            |
| veccine_id          | integer    | null: false                            |
| kuchu_id            | integer    | null: false                            |
| single_id           | integer    |                                        |
| sinior_id           | integer    |                                        |
| price               | integer    |                                        |
| trader              | references | null: false, forein_key: true          |

### Association

- belongs_to :trader
- has_one :family
- has_many_attached :images
- has_one :favorite
- belongs_to_active_hash :breed
- belongs_to_active_hash :ope
- belongs_to_active_hash :sex
- belongs_to_active_hash :age
- belongs_to_active_hash :hair_length
- belongs_to_active_hash :color
- belongs_to_active_hash :how_many
- belongs_to_active_hash :eye_color
- belongs_to_active_hash :character
- belongs_to_active_hash :fleas
- belongs_to_active_hash :veccine
- belongs_to_active_hash :kuchu
- belongs_to_active_hash :single
- belongs_to_active_hash :senior


##  families テーブル

| Column              | Type       | Option                                 |
| ------------------- | ---------- | -------------------------------------- |
| donation            | string     |                                        |
| cat                 | references | null: false, forein_key: true          |
| personal            | references | null: false, forein_key: true          |
| trader              | references | null: false, forein_key: true          |

### Association

- belongs_to :cat
- belongs_to :personal
- belongs_to :trader
- has_one :address


##  favorites テーブル

| Column           | Type       | Option                               |
| ---------------- | ---------- | ------------------------------------ |
| cat              | references | null: false, forein_key: true        |
| personal         | references | null: false, forein_key: true        |

### Association

- belongs_to :cat
- belongs_to :personal


## ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）。
