# BURALLY

TODO: ここにサブタイトルを書く

## 開発環境をセットアップしよう

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

## システム構成

ポイントは Cloud Functions は裏で動くこと。

![システム構成図](https://user-images.githubusercontent.com/13707135/200761344-7721b670-823f-4e3a-9c58-019ae3e5464b.png)

## アーキテクチャ / パッケージ

- [flutter_riverpod v2](https://pub.dev/packages/flutter_riverpod) + [go_router](https://pub.dev/packages/go_router)
- [CODE WITH ANDREA](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/) と [DDD](https://little-hands.hatenablog.com/entry/2018/12/10/ddd-architecture) のアーキテクチャを参考にして、本アプリは下記の4層アーキテクチャで実装しています。

![アーキテクチャ図](https://user-images.githubusercontent.com/13707135/200081763-c2809366-046d-4a82-8367-9bee5a751b90.png)

### Presentation 層

ユーザーとの I/F を担う層。Application 層と Domain 層に依存する。Infrastructure 層に依存してはいけない。

#### Widget

ページや UI 部品の Widget クラス群。State を監視（ watch / listen ）して UI に表現する。ユーザーイベントを検知して Service のメソッドを呼び出す。キャッシュが効かなくなるので直接 Repository Interface を呼び出してはいけない。画面遷移の実装は Widget のイベントハンドラー内で行ってよい。

#### Application 層

アプリケーションのロジックや状態を定義する層。Domain 層に依存する。Presentation 層と Infrastructure 層に依存してはいけない。

#### State

アプリのあらゆる状態。Domain 層の Entity そのものでもよいし、複数の Repository をまたいだ Entity を統合するクラスでもよい。State は `StateProvider` 等でラップされ Widget や他の State から参照される。

#### Service

ユーザーイベントを受け付けて、複数の Repository Interface を呼び出して Entity を受け取って State を更新するサービスクラス。Widget からのメソッド呼び出しや、依存する State の更新を契機に発火する。

### Domain 層

ドメインロジックやドメインオブジェクト（エンティティ）を定義する層。どの層にも依存してはいけない。

#### Entity

Repository Interface で扱うドメインオブジェクト（データの構造体）。入力値のバリデーションは Entity のコンストラクタで実装する。Infrastructure 層が投げる例外はドメイン層で定義する。

#### Repository Interface

データの永続化や外部サービス連携を担う Repository のインターフェース。集約毎に定義する。

### Infrastructure 層

データの永続化や外部サービス連携を担う層。Domain 層に依存する。Presentation 層と Application 層に依存してはいけない。

#### Repository Implements

Repository Interface の実装。Data Source を利用してデータの永続化を行う。

#### Data Source

様々なデータソース。Firebase だったり、API だったり、Hive だったり、SharedPreferences だったり、Isar だったりする。

## フォルダ構成

```  
├── config                                   アプリケーションの設定値、環境変数など
├── application                              アプリケーション層
│   └── <関心事>
│       ├── <state>                          状態クラス群
│       └── <関心事>_service.dart             サービスクラス
├── domain                                   ドメイン層
│   ├── exceptions.dart                      例外クラス
│   └── repository
│       └── <集約>
│           ├── <集約>_repository.dart        リポジトリのインターフェースクラス
│           └── entity                       集約単位のエンティティ
├── infrastructure                           インフラストラクチャ層
│   └── <データソース>
│       └── <集約>
│           └── <集約>_repository.dart       リポジトリの実装
├── presentation
│   ├── app.dart                             アプリケーション
│   ├── router.dart                          ルーティング
│   ├── theme.dart                           テーマ
│   ├── component                            プレゼンテーション層で共通の Widget
│   └── page
│       └── <関心事>
│           ├── component                    画面単位の Widget
│           └── <関心事>_<CURD>page.dart      画面Widget
└── util                                     どの層からもアクセス可能な便利クラス（ロガー、定数など）
```

## 処理の流れの例

ユーザー操作を契機とした処理の流れの例を図にしました。Riverpod の `ref.listen()` を使ってローディング表示や SnackBar の表示を制御しています。図には示していませんがエラー時のエラーダイアログの表示も制御できます。

手続き的に処理をするよりも、コードが簡素になりますしコードの再利用もしやすくなりますが、少し理解しづらいので図にしてみました。

![処理の流れ](https://user-images.githubusercontent.com/13707135/200771755-e7f41636-1cb5-4c44-a966-089c1cb9faec.png)

## ファイル分割の方針

基本的に **関心事** 毎にファイルを分割しています。1つのファイルに複数のクラスがあっても問題ありません。ファイル名は「ファイル名 = クラス名」とはせず **関心事.dart** とします。

## ブランチモデル

git-flow を採用しています。

- 参考サイト
  - [Git-flowって何？](https://qiita.com/KosukeSone/items/514dd24828b485c69a05)

<img src="https://qiita-user-contents.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F53309%2F06140121-a0b6-427f-c149-6858c149738e.png?ixlib=rb-4.0.0&auto=format&gif-q=60&q=75&w=1400&fit=max&s=e54e831191e127e8ec6ed4425c7dfe86" width=400>

### 実装するときは？

上のブランチモデルに従います。具体的には次のとおりです。

1. `develop` ブランチに移動（`checkout`）して最新の状態にする（`pull`）
2. 例 `feature/0-hoge` ブランチを作成して移動する
- ブランチ名の `0` は Issue 番号、`hoge` は実装する内容を端的に表した言葉です
- すべてハイフン区切りでお願いします
3. Feature ブランチ上で実装をする
4. 実装が完了したら GitHub サイト上で `develop` ブランチ向けにプルリクエストを作成する
- 原則レビュー不要、必要に応じて誰かにレビュー依頼を出して下さい
5. GitHub サイト上でマージを実行
6. Issue を Close する

### Firebase 関連のタスクが発生したときは？

発生した時点で [stamp-rally-firebase](https://github.com/team-musashi/stamp-rally-firebase) に Issue を起票して修正をしてください。

## CI (継続的インテグレーション)
GitHub Actions を利用して CI を構築しています。

発火タイミング|実行内容
--|--|
developにマージ<br>PR作成・更新|コードフォーマット<br>静的解析（flutter analyze）<br>テスト（flutter test）<br>Androidリリースビルド<br>結果を共同開発用のSlackに通知

## CD (継続的デリバリー)

対応していません。

