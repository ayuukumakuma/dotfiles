local M = {}

local lsp_group = vim.api.nvim_create_augroup("user-lsp-setup", { clear = true })
local enabled_servers = {
  "bashls",
  "jsonls",
  "just",
  "lua_ls",
  "marksman",
  "nixd",
  "taplo",
  "yamlls",
}

local function lsp_capabilities()
  local ok, blink = pcall(require, "blink.cmp")

  if ok then
    return blink.get_lsp_capabilities()
  end

  return vim.lsp.protocol.make_client_capabilities()
end

local function diagnostic_jump(count)
  return function()
    vim.diagnostic.jump({
      count = count,
      float = true,
    })
  end
end

local normal_mode_maps = {
  { "gD", vim.lsp.buf.declaration, "宣言へ移動" },
  { "gd", vim.lsp.buf.definition, "定義へ移動" },
  { "gi", vim.lsp.buf.implementation, "実装へ移動" },
  { "gy", vim.lsp.buf.type_definition, "型定義へ移動" },
  { "K", vim.lsp.buf.hover, "ホバーを表示" },
  { "<leader>lD", vim.lsp.buf.type_definition, "型定義を表示" },
  { "<leader>la", vim.lsp.buf.code_action, "コードアクション" },
  { "<leader>ld", vim.diagnostic.open_float, "診断を表示" },
  { "<leader>lq", vim.diagnostic.setloclist, "診断リストを開く" },
  { "<leader>lr", vim.lsp.buf.references, "参照を表示" },
  { "<leader>ln", vim.lsp.buf.rename, "名前を変更" },
  { "[d", diagnostic_jump(-1), "前の診断へ移動" },
  { "]d", diagnostic_jump(1), "次の診断へ移動" },
}

local function lsp_buf_map(bufnr, mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, {
    buffer = bufnr,
    desc = desc,
    silent = true,
  })
end

local function setup_diagnostics()
  vim.diagnostic.config({
    severity_sort = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    virtual_text = false,
    float = {
      border = "rounded",
      source = "if_many",
    },
  })
end

local function setup_lsp_attach()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_group,
    callback = function(args)
      local bufnr = args.buf

      for _, map in ipairs(normal_mode_maps) do
        lsp_buf_map(bufnr, "n", map[1], map[2], map[3])
      end

      lsp_buf_map(bufnr, "i", "<C-s>", vim.lsp.buf.signature_help, "シグネチャヘルプ")
    end,
  })
end

local function setup_server_configs()
  local capabilities = lsp_capabilities()

  for _, server in ipairs(enabled_servers) do
    vim.lsp.config(server, {
      capabilities = capabilities,
    })
    vim.lsp.enable(server)
  end
end

function M.setup()
  setup_diagnostics()
  setup_lsp_attach()
  setup_server_configs()
end

return M
