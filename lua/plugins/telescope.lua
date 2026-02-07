return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
	build = 'make'
      },
  },
  opts = {
    defaults = {
      file_igonre_patterns = {
	"%.git/",
	"%.metadata/",
	"node_modules/"
      }
    }
  }
}
