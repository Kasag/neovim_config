# NeoVim設定の改善について

## 🎉 完了したこと

VSCodeからNeoVimに移行される方のために、以下の改善を行いました。

## ✨ 主な追加機能

### 1. 【重要】ワークスペース固有の設定
`neoconf.nvim`を追加しました。これにより、プロジェクトごとに異なる設定を持つことができます。

**使い方**:
```bash
# プロジェクトのルートディレクトリで
echo '{
  "vim": {
    "opt": {
      "tabstop": 4,
      "shiftwidth": 4
    }
  }
}' > .neoconf.json
```

これで、このプロジェクトだけタブ幅が4になります！

### 2. LSPサポート（コード補完）
VSCodeのIntelliSenseと同じような機能が使えます：
- コードを書くと自動的に補完候補が出る
- `gd`で定義へジャンプ
- `gr`で使用箇所を検索
- `<Space>rn`でリネーム
- `K`でドキュメント表示

**対応言語**:
- Python
- TypeScript/JavaScript
- Rust
- Go
- HTML/CSS
- JSON
- Lua

### 3. 初心者に優しい機能

#### which-key
`<Space>`を押すと、使えるコマンドがポップアップで表示されます。
キーバインドを覚える必要がありません！

#### コメント機能
- `gcc`で行をコメントアウト/解除
- 選択範囲を`gc`でコメントアウト

### 4. VSCodeライクなキーバインド

| VSCodeの操作 | NeoVimのキー | 説明 |
|-------------|-------------|------|
| Ctrl+P | `<Space>ff` | ファイル検索 |
| Ctrl+Shift+F | `<Space>g` | テキスト検索 |
| Ctrl+S | `Ctrl+s` | 保存 |
| Ctrl+/ | `gcc` | コメント |
| F12 | `gd` | 定義へジャンプ |
| Shift+F12 | `gr` | 参照検索 |
| F2 | `<Space>rn` | リネーム |
| Ctrl+. | `<Space>ca` | クイックフィックス |
| タブ切り替え | `Shift+h/l` | バッファ切り替え |

### 5. 美しいUI

#### ステータスライン（下部バー）
- 現在のモード表示
- Gitブランチ名
- ファイル情報
- カーソル位置

#### バッファライン（上部タブ）
- VSCodeのタブバーのように、開いているファイルがタブで表示される
- エラー件数も表示される

#### インデントガイド
コードの階層が線で表示され、見やすい

### 6. Git統合
- 変更行の横に記号が表示される（追加・変更・削除）
- `]c`で次の変更箇所へジャンプ
- `<Space>hp`で変更内容をプレビュー
- `<Space>hb`でGit blameを表示

## 📁 追加されたファイル

```
neovim_config/
├── README.md              # 詳細なドキュメント（日本語）
├── CHANGELOG.md           # 変更内容の詳細説明
├── .neoconf.json.example  # ワークスペース設定の例
├── init.lua
└── lua/
    ├── config/
    │   ├── keymaps.lua    # 更新：VSCodeライクなキーバインド
    │   ├── options.lua    # 更新：初心者向け設定
    │   └── lazy.lua
    └── plugins/
        ├── lsp.lua              # 新規：LSPサポート
        ├── nvim-cmp.lua         # 新規：オートコンプリート
        ├── treesitter.lua       # 新規：シンタックスハイライト
        ├── lualine.lua          # 新規：ステータスライン
        ├── bufferline.lua       # 新規：バッファライン
        ├── which-key.lua        # 新規：キーバインドガイド
        ├── comment.lua          # 新規：コメント機能
        ├── indent-blankline.lua # 新規：インデントガイド
        ├── gitsigns.lua         # 新規：Git統合
        ├── neoconf.lua          # 新規：ワークスペース設定
        ├── nvim-tree.lua        # 既存
        ├── telescope.lua        # 既存
        ├── nvim-autopairs.lua   # 既存
        └── nightfox.lua         # 既存
```

## 🚀 すぐに試せること

### 1. ファイル検索（Ctrl+P相当）
```
<Space>ff
```
と入力すると、ファイル検索ができます。

### 2. テキスト検索（Ctrl+Shift+F相当）
```
<Space>g
```
と入力すると、全ファイルからテキスト検索ができます。

### 3. コマンドを調べる
```
<Space>
```
を押すと、使えるコマンドが表示されます。

### 4. ファイルツリーの表示
```
<Space>e
```
でファイルツリーのトグル

### 5. LSPサーバーのインストール
NeoVimを開いて
```
:Mason
```
と入力すると、インストール可能なLSPサーバーが表示されます。

## 💡 次のステップ

### 1. プロジェクトごとの設定を試す
プロジェクトのルートに`.neoconf.json`を作成：
```json
{
  "vim": {
    "opt": {
      "tabstop": 4,
      "shiftwidth": 4
    }
  },
  "lspconfig": {
    "pyright": {
      "python.analysis.typeCheckingMode": "strict"
    }
  }
}
```

### 2. よく使う言語のLSPをインストール
```
:Mason
```
を開いて、必要な言語のLSPサーバーをインストールしてください。

### 3. README.mdを読む
詳細な使い方は`README.md`に記載されています。

### 4. 練習する
- `vimtutor`でVimの基本を学ぶ
- `<Space>`を押してコマンドを探索する
- 日々使っているとすぐに慣れます！

## 🆘 トラブルシューティング

### プラグインがインストールされない
```vim
:Lazy sync
```
を実行してください。

### LSPが動かない
```vim
:Mason
```
で必要なLSPサーバーをインストールしてください。

### 設定の状態を確認
```vim
:checkhealth
```
で設定の状態を確認できます。

## 📚 参考資料

- `README.md` - 詳細なドキュメント
- `CHANGELOG.md` - 追加機能の詳細
- `.neoconf.json.example` - ワークスペース設定の例

---

**楽しいNeoVimライフを！** 🎉

質問があれば、GitHubのIssueでお気軽にどうぞ！
