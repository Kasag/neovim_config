return {
  -- コメント機能 (VSCodeのCtrl+/のような機能)
  'numToStr/Comment.nvim',
  opts = {
    -- gcc: 行コメントのトグル
    -- gbc: ブロックコメントのトグル
    -- gcO: 上の行にコメントを追加
    -- gco: 下の行にコメントを追加
  },
  lazy = false,
}
