# Shell_AutoTools

<!-- repo url. -->
[Stars]: https://img.shields.io/github/stars/Ohno-Tk/Shell_AutoTools?style=social

<!-- development tool url. -->
[License]: https://img.shields.io/badge/license-MIT-blue.svg

<!-- badge. -->
<div align="center">

  <!-- repo info -->
  [![License]](/.github/LICENSE) ![Stars]

</div>

## Table of Contents(目次)
- [Architecture(設計資料)](#architecture)
- [Development Process (開発プロセス)](#development-process)
  - [Commit Message Title Rule (コミットメッセージ規約)](#commit-message-title-rule)
  - [Pull Request(PRの作成方法)](#pull-request)
  - [Issue(チケットの起票方法)](#issue)
- [License(ライセンス)](#license)


## Architecture
```
├─Batchfile_RemoteDesktop_Connection
│      README.md
│      RemoteDesktop_Connection.bat
│
└─PoewerShell_ChangeTimeStamp
    │  ChangeTimeStamp.ps1
    │  README.md
    │  run.bat
    │  test.txt
    │
    └─Readme__image
            image1.JPG
```

## Commit Message Title Rule
```
                        commit title
        commit type         /
                \           |
                 feat: add template url parameter to events
```
`commit type` としては次のようなものがあります。

- feat
    - 新しい機能など。
    - 更新履歴に載るような新しいページを追加。
- fix
    - 意味が変わる修正。
    - 更新履歴に載るような修正。
- docs
    - 基本的には使わない。
    - README.mdやCONTRIBUTING.mdや本体のプロジェクト全体のドキュメントについて。
- refactor
    - 意味が変わらない修正。
    - 更新履歴に載らないような修正。
- style
    - スペースやインデントの調整。
    - Lintエラーの修正など。
- perf
    - パフォーマンス改善。
- test
    - テストに関して。
- chore
    - その他。
    - typoの修正など。

`commit type`は、迷ったらとりあえず`chore`と書きます。
`scope`も省略して問題ないので以下のような形でも問題ありません。

```
chore: コミットメッセージ
```

## Development Process
### Pull Request
Pull Requestはいつでも歓迎しています。

1. まず Issue を作る。
1. Issue に対応したブランチを作る。
1. 作ったブランチからマージしたいブランチへ Pull Request を送る。
1. Pull Request をレビューする。
1. 修正点があれば修正する。
1. マージする。

### Issue
- 質問 => [こちらから質問できます](https://github.com/Ohno-Tk/Shell_AutoTools/issues/new?template=question.md)
- エラーや問題の報告 => [こちらからバグ報告できます。](https://github.com/Ohno-Tk/Shell_AutoTools/issues/new?template=bug_report.md)
- 提案 => [こちらから提案できます。](https://github.com/Ohno-Tk/Shell_AutoTools/issues/new?template=feature_request.md)

[その他のIssue](https://github.com/Ohno-Tk/Shell_AutoTools/issues/new?template=other.md)も歓迎しています。

## License
Released 2021 by Ohno-Tk
