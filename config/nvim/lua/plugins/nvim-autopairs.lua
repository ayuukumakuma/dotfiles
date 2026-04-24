return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    disable_filetype = {
      "TelescopePrompt",
      "spectre_panel",
      "snacks_picker_input",
    },
  },
}
