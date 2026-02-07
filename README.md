# NeoVim設定 - VSCodeユーザー向け

このNeoVim設定は、VSCodeから移行する初心者向けに最適化されています。

## 📋 目次
- [特徴](#特徴)
- [必要なもの](#必要なもの)
- [インストール](#インストール)
- [プラグイン一覧](#プラグイン一覧)
- [基本的な使い方](#基本的な使い方)
- [ワークスペース固有の設定](#ワークスペース固有の設定)
- [キーバインド](#キーバインド)

## ✨ 特徴

- 🚀 **VSCodeライクな操作感**: 馴染みのあるキーバインドと機能
- 📦 **自動プラグイン管理**: Lazy.nvimによる高速なプラグイン管理
- 🔍 **強力な検索**: Telescopeによるファイル・テキスト検索
- 💡 **LSPサポート**: コード補完、定義ジャンプ、リネームなど
- 🎨 **美しいUI**: ステータスライン、バッファライン、ファイルツリー
- 🌲 **Treesitter**: より良いシンタックスハイライト
- 🔧 **ワークスペース設定**: プロジェクトごとに異なる設定を適用可能
- 🆕 **初心者フレンドリー**: which-keyでキーバインドを視覚的にガイド

## 📦 必要なもの

- NeoVim 0.9.0以上
- Git
- Node.js (LSP用、オプション)
- Ripgrep (Telescopeの検索用、オプション)
- 好みのNerdフォント (アイコン表示用、オプション)

### Ubuntuの場合

```bash
# NeoVim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

# 依存関係
sudo apt install git nodejs npm ripgrep

# Nerdフォントのインストール（オプション）
# https://www.nerdfonts.com/font-downloads からダウンロード
```

### macOSの場合

```bash
brew install neovim git node ripgrep
```

## 🚀 インストール

1. この設定を`~/.config/nvim`にクローン:

```bash
# 既存の設定をバックアップ
mv ~/.config/nvim ~/.config/nvim.backup

# この設定をクローン（リポジトリURLは自分のものに置き換えてください）
git clone https://github.com/Kasag/neovim_config.git ~/.config/nvim
```

2. NeoVimを起動:

```bash
nvim
```

初回起動時に自動的にプラグインがインストールされます。

3. LSPサーバーのインストール:

NeoVimを開いて`:Mason`コマンドを実行すると、利用可能なLSPサーバーが表示されます。
必要な言語のLSPサーバーは自動的にインストールされますが、手動でも追加できます。

## 🔌 プラグイン一覧

### コア機能
- **lazy.nvim**: プラグインマネージャー
- **neoconf.nvim**: ワークスペース固有の設定管理

### エディタ機能
- **nvim-tree**: ファイルエクスプローラー（VSCodeのサイドバーライク）
- **telescope.nvim**: ファジーファインダー（Ctrl+P相当）
- **nvim-autopairs**: 括弧の自動補完
- **Comment.nvim**: 簡単なコメントアウト（Ctrl+/相当）
- **indent-blankline**: インデントガイド線

### LSPとコード補完
- **nvim-lspconfig**: LSP設定
- **mason.nvim**: LSPサーバーの自動インストール
- **nvim-cmp**: オートコンプリート（IntelliSense相当）
- **LuaSnip**: スニペットエンジン
- **friendly-snippets**: よく使われるスニペット集

### 見た目
- **nightfox.nvim**: カラーテーマ
- **lualine.nvim**: ステータスライン
- **bufferline.nvim**: バッファ/タブライン
- **nvim-web-devicons**: アイコン

### Git統合
- **gitsigns.nvim**: Git差分表示とGit操作

### シンタックス
- **nvim-treesitter**: 高度なシンタックスハイライト

### 補助ツール
- **which-key.nvim**: キーバインドのポップアップガイド

## 📖 基本的な使い方

### ファイル操作
- `<Space>e`: ファイルツリーのトグル
- `<Space>ff`: ファイル検索
- `<Space>g`: テキスト検索（grep）
- `<Space>fb`: 開いているバッファ一覧
- `<Space>fr`: 最近開いたファイル

### バッファ操作
- `Shift+l`: 次のバッファへ移動
- `Shift+h`: 前のバッファへ移動
- `<Space>bd`: バッファを閉じる

### ウィンドウ操作
- `Ctrl+h/j/k/l`: ウィンドウ間を移動
- `:split`: 水平分割
- `:vsplit`: 垂直分割

### コード編集
- `gcc`: 現在行をコメントアウト/解除
- `gc` (ビジュアルモード): 選択範囲をコメントアウト
- `K`: カーソル下のシンボルのドキュメントを表示
- `gd`: 定義へジャンプ
- `gr`: 参照一覧を表示
- `<Space>rn`: シンボルのリネーム
- `<Space>ca`: コードアクション
- `Tab`: 次の補完候補/スニペットプレースホルダーへ
- `Shift-Tab`: 前の補完候補/スニペットプレースホルダーへ

### Git操作
- `]c`: 次の変更箇所へ
- `[c`: 前の変更箇所へ
- `<Space>hp`: 変更のプレビュー
- `<Space>hb`: 現在行のGit blame表示
- `<Space>hs`: 変更をステージング

### その他
- `<Space>?`: ローカルキーマップを表示
- `Ctrl+s`: ファイル保存
- `:Lazy`: プラグイン管理画面
- `:Mason`: LSPサーバー管理画面

## 🔧 ワークスペース固有の設定

この設定では`neoconf.nvim`を使用して、プロジェクトごとに異なる設定を持つことができます。

### 使い方

プロジェクトのルートディレクトリに`.neoconf.json`ファイルを作成します:

```json
{
  "lspconfig": {
    "lua_ls": {
      "Lua.diagnostics.globals": ["vim"]
    }
  }
}
```

### 設定例

#### Python プロジェクト

```json
{
  "lspconfig": {
    "pyright": {
      "python.analysis.typeCheckingMode": "strict"
    }
  }
}
```

#### TypeScript プロジェクト

```json
{
  "lspconfig": {
    "ts_ls": {
      "typescript.preferences.importModuleSpecifier": "relative"
    }
  }
}
```

#### インデント設定をプロジェクトごとに変更

```json
{
  "vim": {
    "opt": {
      "tabstop": 4,
      "shiftwidth": 4,
      "expandtab": true
    }
  }
}
```

### VSCode設定のインポート

VSCodeの`.vscode/settings.json`がある場合、一部の設定は自動的に読み込まれます。

## ⌨️ キーバインド

### リーダーキー
リーダーキーは`<Space>`に設定されています。

### 基本操作
| キー | モード | 説明 |
|------|--------|------|
| `Ctrl+s` | Normal/Insert | ファイルを保存 |
| `Esc` | Normal | 検索ハイライトをクリア |

### ウィンドウナビゲーション
| キー | モード | 説明 |
|------|--------|------|
| `Ctrl+h` | Normal | 左のウィンドウへ |
| `Ctrl+j` | Normal | 下のウィンドウへ |
| `Ctrl+k` | Normal | 上のウィンドウへ |
| `Ctrl+l` | Normal | 右のウィンドウへ |

### バッファ操作
| キー | モード | 説明 |
|------|--------|------|
| `Shift+l` | Normal | 次のバッファ |
| `Shift+h` | Normal | 前のバッファ |
| `<Space>bd` | Normal | バッファを閉じる |

### ファイル・検索
| キー | モード | 説明 |
|------|--------|------|
| `<Space>e` | Normal | ファイルツリートグル |
| `<Space>o` | Normal | ファイルツリーにフォーカス |
| `<Space>ff` | Normal | ファイル検索 |
| `<Space>g` | Normal | テキスト検索 |
| `<Space>fb` | Normal | バッファ検索 |
| `<Space>fr` | Normal | 最近のファイル |
| `<Space>fh` | Normal | ヘルプ検索 |

### LSP
| キー | モード | 説明 |
|------|--------|------|
| `gd` | Normal | 定義へジャンプ |
| `gr` | Normal | 参照一覧 |
| `gI` | Normal | 実装へジャンプ |
| `K` | Normal | ホバードキュメント |
| `<Space>rn` | Normal | シンボルのリネーム |
| `<Space>ca` | Normal | コードアクション |
| `<Space>ds` | Normal | ドキュメントシンボル |
| `[d` | Normal | 前の診断へ |
| `]d` | Normal | 次の診断へ |

### Git
| キー | モード | 説明 |
|------|--------|------|
| `]c` | Normal | 次の変更箇所 |
| `[c` | Normal | 前の変更箇所 |
| `<Space>hp` | Normal | 変更をプレビュー |
| `<Space>hb` | Normal | 行のblame |
| `<Space>hs` | Normal | Hunkをステージング |
| `<Space>hr` | Normal | Hunkをリセット |

### 編集
| キー | モード | 説明 |
|------|--------|------|
| `gcc` | Normal | 行コメントトグル |
| `gc` | Visual | 選択範囲コメント |
| `J` | Visual | 選択範囲を下へ移動 |
| `K` | Visual | 選択範囲を上へ移動 |
| `<` | Visual | インデント減 |
| `>` | Visual | インデント増 |

## 💡 ヒント

1. **which-keyを活用**: `<Space>`を押すと、利用可能なキーバインドが表示されます
2. **Telescopeの活用**: `<Space>ff`でファイル検索、`<Space>g`でテキスト検索が超便利
3. **LSPの活用**: コード上で`K`を押すとドキュメントが見られます
4. **プロジェクトごとの設定**: `.neoconf.json`でプロジェクト固有の設定を管理
5. **`:checkhealth`**: NeoVimの設定状態を確認できます
6. **`:Mason`**: 新しいLSPサーバーやツールのインストール
7. **`:Lazy`**: プラグインの更新や管理

## 🆘 トラブルシューティング

### プラグインが動かない
```vim
:Lazy sync
```

### LSPが動かない
```vim
:Mason
```
で必要なLSPサーバーをインストール

### アイコンが表示されない
Nerdフォントをインストールして、ターミナルのフォント設定を変更してください

## 📚 参考資料

- [NeoVim公式ドキュメント](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason.nvim](https://github.com/williamboman/mason.nvim)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

## 🤝 貢献

改善案やバグ報告は、GitHubのIssueまでお願いします！

---

**お気に入りのエディタを作り上げて、楽しいコーディングライフを！** 🎉
