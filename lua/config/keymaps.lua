local map = vim.keymap.set

-- leaderキーをスペースに設定する
vim.g.mapleader = " "

-- nvim-tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvim-tree toggle window" })

-- telescope
vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<CR>", { desc = "nvim-tree toggle window" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "nvim-tree toggle window" })

