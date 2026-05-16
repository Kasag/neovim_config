return {
  -----------------------------------------------------------
  -- Mason本体
  -----------------------------------------------------------
  {
    "williamboman/mason.nvim",
    -- 以下の指定で、Lazy.nvimがrequire("mason").setup({})を実行してくれる
    opts = {},
  },
  -----------------------------------------------------------
  -- MasonとLSPConfig連携
  -----------------------------------------------------------
  {
    -- MasonでインストールしたLSPをNeovim LSPとして使いやすくする
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- Masonで自動でインストールしたいLSPサーバー
      ensure_installed = {
        -- lua用
        "lua_ls",
        -- Terraform用
        "terraformls",
      },
      -- MazonでインストールされたLSPを自動有効化
      automatic_enable = true,
    },
  },
  -----------------------------------------------------------
  -- Neovim LSP共通設定 
  -----------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    config = function()
      -------------------------------------------------------
      -- Lua LSP設定
      -------------------------------------------------------
        vim.lsp.config("lua_ls", {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
              },
            },
          },
        })

        vim.diagnostic.config({
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = false,
          severity_sort = true,
        })
    end,
  }
}
