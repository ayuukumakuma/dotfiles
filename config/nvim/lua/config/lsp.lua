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

local function picker(name)
  return function()
    Snacks.picker[name]()
  end
end

local function lspsaga(command)
  return function()
    vim.cmd("Lspsaga " .. command)
  end
end

local function lsp_capabilities()
  local ok, blink = pcall(require, "blink.cmp")

  if ok then
    return blink.get_lsp_capabilities()
  end

  return vim.lsp.protocol.make_client_capabilities()
end

local normal_mode_maps = {
  { "gD", picker("lsp_declarations"), "宣言へ移動" },
  { "gd", picker("lsp_definitions"), "定義へ移動" },
  { "gi", picker("lsp_implementations"), "実装へ移動" },
  { "gr", picker("lsp_references"), "参照を表示" },
  { "gy", picker("lsp_type_definitions"), "型定義へ移動" },
  { "K", lspsaga("hover_doc"), "ホバーを表示" },
  { "<leader>la", lspsaga("code_action"), "コードアクション" },
  { "<leader>ld", vim.diagnostic.open_float, "診断を表示" },
  { "<leader>lD", picker("diagnostics_buffer"), "現在バッファの診断を検索" },
  { "<leader>li", picker("lsp_implementations"), "実装を検索" },
  { "<leader>ln", lspsaga("rename"), "名前を変更" },
  { "<leader>lq", vim.diagnostic.setloclist, "診断リストを開く" },
  { "<leader>lr", picker("lsp_references"), "参照を検索" },
  { "<leader>ls", picker("lsp_symbols"), "シンボルを検索" },
  { "<leader>lS", picker("lsp_workspace_symbols"), "ワークスペースシンボルを検索" },
  { "[d", lspsaga("diagnostic_jump_prev"), "前の診断へ移動" },
  { "]d", lspsaga("diagnostic_jump_next"), "次の診断へ移動" },
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
