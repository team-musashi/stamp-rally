---
name: 本番環境リリース
about: 本番環境リリース
title: 'v0.0.0 本番環境リリース'
labels: enhancement
assignees: ''

---

## 本リリースに限定した特記事項

- [ ] あれば記載する

## 本番リリース手順

- [ ] [stamp-rally-firebase](https://github.com/team-musashi/stamp-rally-firebase) の最新が本番デプロイ済みであることを確認する
- [ ] `develop` から `release/vX.0.0` へリリースブランチを作成する
- [ ] リリースブランチで `pubspec.yaml` の `version` を上げる
- [ ] リリースブランチ => `develop` のプルリクエストを作成
- [ ] リリース前テストを実施し、適宜リリースブランチで修正する
- [ ] リリースの準備が完了したら、リリースブランチ => `main` のプルリクエストを作成
- [ ] 上で作成したプルリクエストを `main` ブランチにマージ
- [ ] Tag をつける（例：v0.0.0）
- [ ] Release を作成する
- [ ] 元からあったプルリクエストを `develop` ブランチにマージ
- [ ] Android アプリをストアでリリースする
- [ ] iOS アプリをストアでリリースする
