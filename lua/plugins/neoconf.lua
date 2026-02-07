return {
  -- ワークスペースごとの設定を可能にする
  -- プロジェクトルートに .neoconf.json を置くことで、そのプロジェクト専用の設定ができる
  'folke/neoconf.nvim',
  cmd = "Neoconf",
  config = function()
    require('neoconf').setup({
      -- ローカル設定ファイル名
      local_settings = ".neoconf.json",
      -- グローバル設定ファイル名
      global_settings = "neoconf.json",
      -- プラグインごとの設定を有効化
      import = {
        vscode = true, -- VSCodeの設定をインポート
        coc = false,
        nlsp = false,
      },
      -- 設定変更時に自動で通知
      live_reload = true,
      -- プロジェクトルートの検出パターン
      filetype_jsonc = true,
    })
  end,
}
