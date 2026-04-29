-- blink.cmp で LSP、パス、スニペット、バッファ補完を有効にします。
return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  version = "1.*",
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        border = "single",
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "single",
        },
      },
    },
    signature = {
      enabled = true,
      window = {
        border = "single",
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
  opts_extend = { "sources.default" },
}
