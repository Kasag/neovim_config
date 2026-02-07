return {
  -- オートコンプリート (VSCodeのIntelliSenseのような機能)
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- スニペットエンジン (VSCodeのスニペット機能)
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- よく使われるスニペット集
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    
    -- 補完ソース
    'hrsh7th/cmp-nvim-lsp',  -- LSPからの補完
    'hrsh7th/cmp-path',      -- ファイルパス補完
    'hrsh7th/cmp-buffer',    -- バッファからの補完
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- VSCodeライクなキーバインド
      mapping = cmp.mapping.preset.insert {
        -- 次の候補を選択 (Ctrl+n)
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- 前の候補を選択 (Ctrl+p)
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        
        -- ドキュメントのスクロール
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- 補完の確定 (Enter)
        ['<CR>'] = cmp.mapping.confirm { select = true },

        -- 補完メニューを手動で開く (Ctrl+Space)
        ['<C-Space>'] = cmp.mapping.complete {},

        -- スニペットの次のプレースホルダーへ移動
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        
        -- スニペットの前のプレースホルダーへ移動
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
      },
    }
  end,
}
