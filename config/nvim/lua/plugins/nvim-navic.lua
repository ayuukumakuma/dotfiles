-- nvim-navic で LSP の documentSymbol を使った winbar breadcrumbs を表示します。
return {
  "SmiteshP/nvim-navic",
  event = "LspAttach",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  opts = {
    highlight = true,
    separator = " > ",
    depth_limit = 5,
    depth_limit_indicator = "..",
    safe_output = true,
    lazy_update_context = true,
    lsp = {
      auto_attach = true,
      preference = {
        "nixd",
        "lua_ls",
        "just",
      },
    },
  },
  config = function(_, opts)
    local navic = require("nvim-navic")

    navic.setup(opts)

    function _G.nvim_navic_location()
      local bufnr = vim.api.nvim_get_current_buf()

      if vim.bo[bufnr].buftype ~= "" or not navic.is_available(bufnr) then
        return ""
      end

      return navic.get_location(nil, bufnr)
    end

    local function has_document_symbol_client(bufnr)
      for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
        if client.server_capabilities.documentSymbolProvider then
          return true
        end
      end

      return false
    end

    local function enable_winbar(bufnr)
      if vim.bo[bufnr].buftype ~= "" or not has_document_symbol_client(bufnr) then
        return
      end

      for _, winid in ipairs(vim.fn.win_findbuf(bufnr)) do
        vim.wo[winid].winbar = "%{%v:lua.nvim_navic_location()%}"
      end
    end

    local navic_group = vim.api.nvim_create_augroup("NvimNavicWinbar", { clear = true })
    vim.api.nvim_create_autocmd("LspAttach", {
      group = navic_group,
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client.server_capabilities.documentSymbolProvider then
          enable_winbar(args.buf)
        end
      end,
    })

    enable_winbar(vim.api.nvim_get_current_buf())
  end,
}
