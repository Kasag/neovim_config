return {
  -- Treesitter: より良いシンタックスハイライトとコード理解
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'vim',
      'vimdoc',
      'python',
      'javascript',
      'typescript',
      'json',
      'yaml',
      'css',
      'rust',
      'go',
    },
    -- 自動インストール (ファイルを開いたときに自動的にパーサーをインストール)
    auto_install = true,
    highlight = {
      enable = true,
      -- 大きなファイルでは無効化
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
