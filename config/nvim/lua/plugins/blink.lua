return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    keymap = {
      preset = "default",
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      documentation = {
        auto_show = true,
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
    snippets = {
      preset = "default",
    },
  },
  opts_extend = {
    "sources.default",
  },
}
