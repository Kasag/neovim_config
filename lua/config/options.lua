-- yankとシステムクリップボードの共有
if vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
  vim.g.clipboard = "osc52"
end

vim.opt.clipboard:append("unnamedplus")

-- フォーマット関連
vim.opt.expandtab = true   -- Tabキーでもスペースを使う
vim.opt.shiftwidth = 2    -- 自動インデント幅
vim.opt.tabstop = 2       -- タブの見た目幅
vim.opt.softtabstop = 2   -- <Tab>/<BS> 時のスペース数
vim.opt.smartindent = true

-- 行表示
vim.opt.number = true
vim.opt.relativenumber = true

