# 追加された機能とプラグイン

## 🎯 主な改善点

### 1. LSPサポート（コード補完・定義ジャンプなど）
**追加されたファイル**: `lua/plugins/lsp.lua`, `lua/plugins/nvim-cmp.lua`

VSCodeのIntelliSenseのような機能が使えるようになりました：
- コード補完（自動的に関数や変数の候補が表示される）
- 定義へのジャンプ（`gd`で定義へジャンプ）
- リファレンス検索（`gr`で使用箇所を検索）
- シンボルのリネーム（`<Space>rn`で一括リネーム）
- ホバードキュメント（`K`でドキュメント表示）
- コードアクション（`<Space>ca`で修正候補表示）

**対応言語**:
- Lua（NeoVim設定用）
- Python
- TypeScript/JavaScript
- Rust
- Go
- HTML/CSS
- JSON

### 2. スニペット機能
**プラグイン**: LuaSnip + friendly-snippets

VSCodeのスニペット機能が使えます。例えば`if`と入力して補完を選択すると、if文のテンプレートが挿入されます。

### 3. UIの改善

#### ステータスライン（下部バー）
**追加されたファイル**: `lua/plugins/lualine.lua`

画面下部に以下の情報が表示されます：
- 現在のモード（Normal/Insert/Visual）
- Gitブランチ名
- ファイル名
- エンコーディング
- ファイルタイプ
- カーソル位置

#### バッファライン（タブバー）
**追加されたファイル**: `lua/plugins/bufferline.lua`

画面上部にVSCodeのようなタブバーが表示されます：
- 開いているファイルのタブ表示
- タブの切り替えが視覚的に分かりやすい
- エラーや警告の件数も表示

#### インデントガイド
**追加されたファイル**: `lua/plugins/indent-blankline.lua`

コードの階層構造が線で表示され、見やすくなります。

### 4. Git統合
**追加されたファイル**: `lua/plugins/gitsigns.lua`

VSCodeのGit機能のような表示：
- 変更行の横に記号が表示される（追加・変更・削除）
- `]c`/`[c`で変更箇所へジャンプ
- `<Space>hp`で変更内容をプレビュー
- `<Space>hb`でGit blame表示

### 5. Treesitter（シンタックスハイライト）
**追加されたファイル**: `lua/plugins/treesitter.lua`

より正確で美しいシンタックスハイライトが使えます。

### 6. 初心者向け機能

#### which-key
**追加されたファイル**: `lua/plugins/which-key.lua`

`<Space>`を押すと、利用可能なキーバインドがポップアップで表示されます。
キーバインドを覚えていなくても大丈夫！

#### Comment.nvim
**追加されたファイル**: `lua/plugins/comment.lua`

VSCodeの`Ctrl+/`のようにコメントアウトが簡単にできます：
- `gcc`: 現在行をコメントアウト/解除
- `gc`: 選択範囲をコメントアウト（ビジュアルモード）

### 7. ワークスペース固有の設定
**追加されたファイル**: `lua/plugins/neoconf.lua`, `.neoconf.json.example`

プロジェクトのルートに`.neoconf.json`ファイルを置くことで、
そのプロジェクト専用の設定ができます！

例：
- プロジェクトAはタブ幅4
- プロジェクトBはタブ幅2
- プロジェクトCはPythonの型チェック厳密モード

### 8. キーバインドの改善
**更新されたファイル**: `lua/config/keymaps.lua`

VSCodeユーザーに馴染みやすいキーバインドを追加：
- `Ctrl+s`: ファイル保存
- `Shift+l/h`: バッファ切り替え（タブ切り替えのような感覚）
- `Ctrl+h/j/k/l`: ウィンドウ間移動
- その他、Telescopeやファイルツリーの操作を追加

### 9. エディタ設定の改善
**更新されたファイル**: `lua/config/options.lua`

初心者に優しい設定を追加：
- カーソル行のハイライト
- スマートな検索（大文字小文字の自動判別）
- マウス操作の有効化
- 分割ウィンドウの配置改善
- 永続的なアンドゥ履歴

### 10. ドキュメント
**追加されたファイル**: `README.md`

日本語で詳細な説明を記載：
- インストール方法
- 各プラグインの説明
- キーバインド一覧
- ワークスペース設定の例
- トラブルシューティング

## 📦 追加されたプラグイン一覧

1. **neovim/nvim-lspconfig** - LSP設定
2. **williamboman/mason.nvim** - LSPサーバー管理
3. **williamboman/mason-lspconfig.nvim** - MasonとLSPConfigの連携
4. **j-hui/fidget.nvim** - LSP通知UI
5. **folke/neodev.nvim** - Neovim Lua開発サポート
6. **hrsh7th/nvim-cmp** - オートコンプリート
7. **L3MON4D3/LuaSnip** - スニペットエンジン
8. **rafamadriz/friendly-snippets** - スニペット集
9. **hrsh7th/cmp-nvim-lsp** - LSP補完ソース
10. **hrsh7th/cmp-path** - パス補完
11. **hrsh7th/cmp-buffer** - バッファ補完
12. **saadparwaiz1/cmp_luasnip** - LuaSnip連携
13. **nvim-treesitter/nvim-treesitter** - シンタックスハイライト
14. **nvim-lualine/lualine.nvim** - ステータスライン
15. **akinsho/bufferline.nvim** - バッファライン
16. **folke/which-key.nvim** - キーバインドガイド
17. **numToStr/Comment.nvim** - コメント機能
18. **lukas-reineke/indent-blankline.nvim** - インデントガイド
19. **lewis6991/gitsigns.nvim** - Git統合
20. **folke/neoconf.nvim** - ワークスペース設定管理

## 🚀 使い始めるには

1. NeoVimを起動すると、自動的にプラグインがインストールされます
2. `:Mason`を実行して、必要な言語のLSPサーバーがインストールされているか確認
3. `:checkhealth`でシステムの状態を確認
4. `<Space>`キーを押して、利用可能なコマンドを確認
5. README.mdを読んで、詳細な使い方を確認

## 💡 次のステップ

- プロジェクトのルートに`.neoconf.json`を作成して、プロジェクト固有の設定を試す
- `:Mason`で追加の言語サポートをインストール
- `<Space>ff`でファイル検索、`<Space>g`でテキスト検索を試す
- `gcc`でコメントアウトを試す
- LSP機能（`gd`で定義ジャンプなど）を試す

楽しいNeoVimライフを！✨
