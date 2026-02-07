return {
  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Mason: LSPサーバーの自動インストール (VSCodeのように簡単にセットアップ)
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      
      -- 便利な通知UI
      { 'j-hui/fidget.nvim', opts = {} },
      
      -- Neovim設定のための追加サポート
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      -- LSPサーバーがアタッチされたときのキーマップ設定
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- VSCodeライクなキーバインド
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        end,
      })

      -- LSPの機能設定
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- よく使われるLSPサーバーの設定
      local servers = {
        -- Lua (Neovim設定用)
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
        -- Python
        pyright = {},
        -- TypeScript/JavaScript
        ts_ls = {},
        -- Rust
        rust_analyzer = {},
        -- Go
        gopls = {},
        -- HTML/CSS
        html = {},
        cssls = {},
        -- JSON
        jsonls = {},
      }

      -- Mason設定
      require('mason').setup()
      
      local ensure_installed = vim.tbl_keys(servers or {})
      require('mason-lspconfig').setup {
        ensure_installed = ensure_installed,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
