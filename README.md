# dot_files

個人用のドットファイル（設定ファイル）リポジトリです。

## 概要

このリポジトリには、ターミナル環境の設定ファイルが含まれています。

## ファイル一覧

### `.tmux.conf`
tmux（ターミナルマルチプレクサ）の設定ファイル。

**主な機能:**
- **Vim 風のキーバインディング**: ペイン移動・リサイズが Vim と同じ操作で可能
- **マウスサポート**: ウィンドウ・ペイン操作とスクロールをマウスで実行可能
- **256色 + TrueColor**: 高品質な色表示対応
- **大容量履歴**: 100,000 行の履歴を保持
- **自動ウィンドウ名変更**: アクティブなプロセスに応じてウィンドウ名を自動更新

**主なキーバインディング:**
- `Ctrl-H/J/K/L`: ペイン移動（左/下/上/右）
- `Shift-H/J/K/L`: ペインサイズ調整
- `|`: ウィンドウを水平分割
- `-`: ウィンドウを垂直分割
- `r`: 設定ファイルをリロード
- コピーモード: `v` で選択開始、`y` でコピー

### `.zshrc`
Zsh シェルの設定ファイル。Oh My Zsh フレームワークを使用し、複数の開発環境を統合します。

**含まれる設定:**
- **Oh My Zsh**: プラグイン管理とテーマ（robbyrussell）
- **Node.js (NVM)**: Node Version Manager による Node.js 環境管理
- **pnpm**: 高速な Node.js パッケージマネージャー
- **GHCup**: Haskell 環境管理
- **FCITX5**: 日本語入力サポート（GTK・Qt アプリ対応）

**主な特徴:**
- セクション化された設定で保守性を向上
- 日本語コメント付きで設定内容を明確化
- `$HOME` 変数を使用した相対パスで移植性を確保

## インストール方法

```bash
# リポジトリをクローン
git clone https://github.com/daenomo/dot_files.git ~/.dot_files

# tmux 設定をホームディレクトリにシンボリックリンク
ln -s ~/.dot_files/.tmux.conf ~/.tmux.conf

# tmux を起動（既存の tmux セッションを使用している場合は設定をリロード）
tmux
# または既存セッション内で Ctrl-b + r
```

## 設定の変更

`.tmux.conf` を編集した後、tmux セッション内で以下を実行して設定をリロード：

```
Ctrl-b + r
```

またはコマンドラインから：

```bash
tmux source-file ~/.tmux.conf
```

## ライセンス

このリポジトリのコンテンツは自由に使用・改変できます。

## 関連リンク

- [tmux 公式ドキュメント](https://github.com/tmux/tmux/wiki)
- [.tmux.conf サンプル集](https://github.com/tmux/tmux/wiki/Getting-Started)
