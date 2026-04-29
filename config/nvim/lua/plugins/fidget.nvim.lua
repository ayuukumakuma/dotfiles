-- fidget.nvim で LSP の進行状況を控えめに表示します。
-- 通常通知は snacks.nvim の notifier に任せるため vim.notify は上書きしません。
return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  opts = {
    notification = {
      override_vim_notify = false,
    },
  },
}
