-- 前提
--   mise use terraform@latest
--   mise use terraform-ls@latest
return {
  {
    -- シンタックスハイライト
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "terraform",
        "hcl",
      },
    },
  },
  {
    -- フォーマッター実行用プラグイン
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- ファイルタイプごとに利用するフォーマッタを指定。下２点はおまじない
        terraform = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
        hcl = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        tfvars = { "terraform_fmt" },
      },
      -- 保存時に自動フォーマット
      format_on_save = {
        -- フリーズ時にレスポンスを待つ最大時間
        timeout_ms = 1000,
        -- conformでformatterが見つからない場合、LSP側にフォールバック
        lsp_fallback = true,
      }
    }
  }
}


