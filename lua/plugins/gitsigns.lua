return {
  -- Git統合 (VSCodeのGit機能のような表示)
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    signcolumn = true,  -- サイン列を表示
    numhl      = false, -- 行番号のハイライト
    linehl     = false, -- 行全体のハイライト
    word_diff  = false, -- 単語単位のdiff
    watch_gitdir = {
      follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false, -- 現在行のblame表示
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 1000,
      ignore_whitespace = false,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, {expr=true, desc = 'Next git hunk'})

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {expr=true, desc = 'Previous git hunk'})

      -- Actions
      map('n', '<leader>hs', gs.stage_hunk, {desc = 'Stage hunk'})
      map('n', '<leader>hr', gs.reset_hunk, {desc = 'Reset hunk'})
      map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = 'Stage hunk'})
      map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = 'Reset hunk'})
      map('n', '<leader>hS', gs.stage_buffer, {desc = 'Stage buffer'})
      map('n', '<leader>hu', gs.undo_stage_hunk, {desc = 'Undo stage hunk'})
      map('n', '<leader>hR', gs.reset_buffer, {desc = 'Reset buffer'})
      map('n', '<leader>hp', gs.preview_hunk, {desc = 'Preview hunk'})
      map('n', '<leader>hb', function() gs.blame_line{full=true} end, {desc = 'Blame line'})
      map('n', '<leader>tb', gs.toggle_current_line_blame, {desc = 'Toggle git blame'})
      map('n', '<leader>hd', gs.diffthis, {desc = 'Diff this'})
      map('n', '<leader>hD', function() gs.diffthis('~') end, {desc = 'Diff this ~'})
      map('n', '<leader>td', gs.toggle_deleted, {desc = 'Toggle deleted'})
    end
  },
}
