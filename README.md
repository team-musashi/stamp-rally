# スタラリ

TODO: ここにサブタイトルを書く

## 開発環境セットアップしよう

開発マシンの OS は Mac、IDE は VSCode の利用を前提としています。

### `fvm` をインストールして Flutter SDK のインストールをする

次の記事を参考にして、`fvm` をインストールして、`fvm` コマンドが使える状態にしましょう。

[FVMでFlutter SDKのバージョンをプロジェクト毎に管理する](https://zenn.dev/riscait/articles/flutter-version-management)

次のコマンドを実行して本プロジェクト指定の Flutter SDK をインスト−ルをしましょう。

```
fvm install
```

### Git コミット簡単ツールのインストール

次の記事を参考にして、Git コミット時に Prefix や絵文字を簡単に追加できるツールである [commitizen](https://github.com/commitizen/cz-cli) と [git-cz](https://github.com/streamich/git-cz) をインスト−ルしましょう。

[Commitizenを使ってgitのコミットメッセージをしっかり書こう](https://dev.classmethod.jp/articles/commitizen/)

適当なファイルを修正・ステージングにあげて `git cz` というコマンドを打って次のような表示が出れば OK です。

<img width="500" src="https://user-images.githubusercontent.com/13707135/199337450-251361bb-51b1-4a26-8362-b3da4e1b305a.png">


## アプリを実行しよう

開発環境のセットアップが終わったら、VSCode 右下から実行するデバイスを選択し、実行したい Configuration を選択して実行してみましょう。

Configuration 名|プラットフォーム|接続先の Firebase
--|--|--
app-dev|iOS / Android|[flutteruniv-stamp-rally-dev](https://console.firebase.google.com/u/1/project/flutteruniv-stamp-rally-dev/overview)
app-prod|iOS / Android|[flutteruniv-stamp-rally-prod](https://console.firebase.google.com/u/1/project/flutteruniv-stamp-rally-prod/overview)

## 実装時の Tips

### コードの自動生成

`go_router_builder` や `freezed` を使った自動生成ファイルを変更した場合は次のコマンドを実行してください。

```bash
make build-runner
```

## アーキテクチャ / パッケージ

- [flutter_riverpod v2](https://pub.dev/packages/flutter_riverpod) + [state_notifier](https://pub.dev/packages/state_notifier) + [freezed](https://pub.dev/packages/freezed) + [go_router](https://pub.dev/packages/go_router)
- [CODE WITH ANDREA](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/) と [DDD](https://little-hands.hatenablog.com/entry/2018/12/10/ddd-architecture) のアーキテクチャを参考にして、本アプリは下記の4層アーキテクチャで実装しています。

![アーキテクチャ図](https://user-images.githubusercontent.com/13707135/199193570-3417e7b9-3d6e-4d5a-ad0e-c02e5330c4e7.jpg)

### Presentation 層

#### Widget

ページや UI 部品の Widget クラス群。State を監視（ watch / listen ）して UI に表現する。ユーザーイベントを検知して Service のメソッドを呼び出す。キャッシュが効かなくなるので直接 Repository Interface を呼び出してはいけない。

#### Application 層

#### State

アプリのあらゆる状態。Entity そのものでもよいし、新たに定義した状態クラスでもよい。`StateProvider` 等でラップされ Widget や他の State から参照される。

#### Service

ユーザーイベントを受け付けて、複数の Repository Interface を呼び出して Entity を受け取って State を更新する。Widget からのメソッド呼び出しや、依存する State の更新を契機に発火する。

### Domain 層

#### Entity

Repository Interface で扱うデータの構造体。どの層にも依存してはいけない。入力値のバリデーションは Entity のコンストラクタで実装する。Infrastructure 層が投げる例外はドメイン層で定義する。

#### Repository Interface

データの永続化をになう Repository のインターフェース。どの層にも依存してはいけない。

### Infrastructure 層

#### Repository Implements

Repository Interface の実装。Data Source を利用してデータの永続化を行う。

#### Data Source

様々なデータソース。Firebase だったり、API だったり、Hive だったり、SharedPreferences だったり、Isar だったりする。

## フォルダ構成

```  
├── config                                   設定値、環境変数など
├── application                              アプリケーション層
│   └── <集約>
│       ├── <state>                          状態
│       └── <feature>_service.dart           サービスクラス
├── domain                                   ドメイン層
│   ├── exceptions.dart                      例外クラス
│   └── repository
│       └── <集約>
│           ├── <集約>_repository.dart        リポジトリのインターフェースクラス
│           └── entity                       集約単位のエンティティ
├── infrastructure                           インフラストラクチャ層
│   └── <data_source>
│       └── <集約>
│           └── <集約>_repository.dart       リポジトリの実装
├── presentation
│   ├── app.dart                             アプリケーション
│   ├── component                            プレゼンテーション層で共通の Widget
│   └── page
│       └── <関心事>
│           ├── component                    画面単位の Widget
│           └── <関心事>_<CURD>page.dart      画面Widget
└── util                                     どの層からもアクセス可能なクラス、拡張機能、ロガー、言語ファイルなど
```

### ファイル分割の方針

基本的に **関心事** 毎にファイルを分割しています。1つのファイルに複数のクラスがあっても問題ありません。ファイル名は「ファイル名 = クラス名」とはせず **関心事.dart** とします。

## ブランチモデル

git-flow を採用しています。

<img src="https://qiita-user-contents.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F53309%2F06140121-a0b6-427f-c149-6858c149738e.png?ixlib=rb-4.0.0&auto=format&gif-q=60&q=75&w=1400&fit=max&s=e54e831191e127e8ec6ed4425c7dfe86" width=400>

- 参考サイト
  - [Git-flowって何？](https://qiita.com/KosukeSone/items/514dd24828b485c69a05)


## CI (継続的インテグレーション)

対応していません。

## CD (継続的デリバリー)

対応していません。

