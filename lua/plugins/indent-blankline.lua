return {
  -- インデントガイド (コードの構造を見やすく)
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = {
      char = '│',
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
    },
  },
}
