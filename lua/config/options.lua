-- yankとシステムクリップボードの共有
vim.opt.clipboard:append("unnamedplus")

-- フォーマット関連
vim.opt.expandtab = true   -- Tabキーでもスペースを使う
vim.opt.shiftwidth = 2    -- 自動インデント幅
vim.opt.tabstop = 2       -- タブの見た目幅
vim.opt.softtabstop = 2   -- <Tab>/<BS> 時のスペース数
vim.opt.smartindent = true
vim.opt.autoindent = true  -- 自動インデント

-- 行表示
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true  -- カーソル行をハイライト
vim.opt.wrap = false       -- 行の折り返しを無効化

-- 検索
vim.opt.ignorecase = true  -- 検索時に大文字小文字を区別しない
vim.opt.smartcase = true   -- ただし、大文字を含む場合は区別する
vim.opt.hlsearch = true    -- 検索結果をハイライト
vim.opt.incsearch = true   -- インクリメンタルサーチ

-- UI設定
vim.opt.signcolumn = "yes" -- サイン列を常に表示（LSPやGit記号用）
vim.opt.termguicolors = true -- 24-bitカラーを有効化
vim.opt.showmode = false   -- モード表示を無効化（ステータスラインで表示するため）
vim.opt.mouse = "a"        -- マウス操作を有効化
vim.opt.scrolloff = 8      -- スクロール時の余白
vim.opt.sidescrolloff = 8  -- 横スクロール時の余白

-- ファイル処理
vim.opt.updatetime = 250   -- スワップファイル書き込みまでの時間（ms）
vim.opt.timeoutlen = 300   -- キーマップの待機時間（ms）
vim.opt.backup = false     -- バックアップファイルを作成しない
vim.opt.swapfile = false   -- スワップファイルを作成しない
vim.opt.undofile = true    -- 永続的なアンドゥを有効化

-- ウィンドウ分割
vim.opt.splitright = true  -- 縦分割時に右に開く
vim.opt.splitbelow = true  -- 横分割時に下に開く

-- コマンドライン
vim.opt.cmdheight = 1      -- コマンドラインの高さ

-- 補完メニュー
vim.opt.completeopt = "menuone,noselect,noinsert" -- 補完オプション

-- ワイルドメニュー
vim.opt.wildmode = "longest:full,full" -- コマンド補完モード

