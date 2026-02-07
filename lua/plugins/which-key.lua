return {
  -- which-key: キーマップのガイド表示 (初心者に優しい)
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    -- 設定はデフォルトのままでOK
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
