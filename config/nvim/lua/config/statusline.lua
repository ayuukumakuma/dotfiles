local M = {}

local mode_names = {
  n = "NORMAL",
  no = "O-PENDING",
  nov = "O-PENDING",
  noV = "O-PENDING",
  ["no\22"] = "O-PENDING",
  niI = "NORMAL",
  niR = "NORMAL",
  niV = "NORMAL",
  nt = "NORMAL",
  v = "VISUAL",
  vs = "VISUAL",
  V = "V-LINE",
  Vs = "V-LINE",
  ["\22"] = "V-BLOCK",
  ["\22s"] = "V-BLOCK",
  s = "SELECT",
  S = "S-LINE",
  ["\19"] = "S-BLOCK",
  i = "INSERT",
  ic = "INSERT",
  ix = "INSERT",
  R = "REPLACE",
  Rc = "REPLACE",
  Rx = "REPLACE",
  Rv = "V-REPLACE",
  c = "COMMAND",
  cv = "EX",
  ce = "EX",
  r = "PROMPT",
  rm = "MORE",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  t = "TERMINAL",
}

local mode_highlights = {
  NORMAL = "StatusLineModeNormal",
  ["O-PENDING"] = "StatusLineModeVisual",
  VISUAL = "StatusLineModeVisual",
  ["V-LINE"] = "StatusLineModeVisual",
  ["V-BLOCK"] = "StatusLineModeVisual",
  SELECT = "StatusLineModeVisual",
  ["S-LINE"] = "StatusLineModeVisual",
  ["S-BLOCK"] = "StatusLineModeVisual",
  INSERT = "StatusLineModeInsert",
  REPLACE = "StatusLineModeReplace",
  ["V-REPLACE"] = "StatusLineModeReplace",
  COMMAND = "StatusLineModeCommand",
  EX = "StatusLineModeCommand",
  PROMPT = "StatusLineModeCommand",
  MORE = "StatusLineModeCommand",
  CONFIRM = "StatusLineModeCommand",
  SHELL = "StatusLineModeCommand",
  TERMINAL = "StatusLineModeTerminal",
}

local function palette()
  return require("catppuccin.palettes").get_palette("latte")
end

local function set_highlight(name, options)
  vim.api.nvim_set_hl(0, name, options)
end

local function setup_highlights()
  local colors = palette()
  local surface_groups = {
    StatusLine = { fg = colors.text, bg = colors.mantle },
    StatusLineNC = { fg = colors.overlay0, bg = colors.crust },
    StatusLineSurface = { fg = colors.text, bg = colors.mantle },
    StatusLineAccent = { fg = colors.blue, bg = colors.mantle, bold = true },
    StatusLineMuted = { fg = colors.overlay1, bg = colors.mantle },
    StatusLineGit = { fg = colors.green, bg = colors.mantle },
    StatusLineDiagError = { fg = colors.red, bg = colors.mantle },
    StatusLineDiagWarn = { fg = colors.yellow, bg = colors.mantle },
    StatusLineDiagHint = { fg = colors.teal, bg = colors.mantle },
    StatusLineDiagInfo = { fg = colors.sky, bg = colors.mantle },
    StatusLineLsp = { fg = colors.mauve, bg = colors.mantle },
  }

  for group, options in pairs(surface_groups) do
    set_highlight(group, options)
  end

  local mode_colors = {
    StatusLineModeNormal = colors.blue,
    StatusLineModeInsert = colors.green,
    StatusLineModeVisual = colors.mauve,
    StatusLineModeReplace = colors.red,
    StatusLineModeCommand = colors.peach,
    StatusLineModeTerminal = colors.teal,
  }

  for group, fg in pairs(mode_colors) do
    set_highlight(group, {
      fg = colors.base,
      bg = fg,
      bold = true,
    })
  end
end

local function is_active(winid)
  return winid == vim.api.nvim_get_current_win()
end

local function current_mode()
  local mode = vim.api.nvim_get_mode().mode

  return mode_names[mode] or mode
end

local function mode_section(active)
  local name = current_mode()
  local highlight = active and (mode_highlights[name] or "StatusLineAccent") or "StatusLineMuted"

  return table.concat({
    "%#",
    highlight,
    "#",
    " ",
    name,
    " ",
    "%#StatusLineSurface#",
  })
end

local function buffer_name(bufnr)
  local name = vim.api.nvim_buf_get_name(bufnr)

  if name == "" then
    return "[No Name]"
  end

  return vim.fn.fnamemodify(name, ":~:.")
end

local function filename_section(bufnr, active)
  local ok, mini_icons = pcall(require, "mini.icons")
  local name = buffer_name(bufnr)
  local icon = "󰈔"
  local icon_highlight = active and "%#StatusLineAccent#" or "%#StatusLineMuted#"

  if ok then
    local file_icon, file_highlight = mini_icons.get("file", name)

    if file_icon then
      icon = file_icon
    end

    if active and file_highlight then
      icon_highlight = "%#" .. file_highlight .. "#"
    end
  end

  local flags = {}

  if vim.bo[bufnr].modified then
    table.insert(flags, "%#StatusLineAccent#●")
  end

  if not vim.bo[bufnr].modifiable or vim.bo[bufnr].readonly then
    table.insert(flags, "%#StatusLineMuted#")
  end

  local section = {
    icon_highlight,
    icon,
    " ",
    active and "%#StatusLineSurface#" or "%#StatusLineNC#",
    name,
  }

  if #flags > 0 then
    table.insert(section, " ")
    table.insert(section, table.concat(flags, " "))
  end

  return table.concat(section)
end

local function branch_name(bufnr)
  local minigit = vim.b[bufnr].minigit_summary

  if type(minigit) == "table" and minigit.head and minigit.head ~= "" then
    return minigit.head
  end

  local gitsigns = vim.b[bufnr].gitsigns_head

  if type(gitsigns) == "string" and gitsigns ~= "" then
    return gitsigns
  end
end

local function git_section(bufnr, active)
  local branch = branch_name(bufnr)

  if not branch then
    return ""
  end

  local highlight = active and "%#StatusLineGit#" or "%#StatusLineMuted#"

  return table.concat({
    highlight,
    "   ",
    branch,
    active and "%#StatusLineSurface#" or "%#StatusLineNC#",
  })
end

local function diagnostic_section(bufnr, active)
  local severities = {
    { severity = vim.diagnostic.severity.ERROR, icon = "", highlight = "StatusLineDiagError" },
    { severity = vim.diagnostic.severity.WARN, icon = "", highlight = "StatusLineDiagWarn" },
    { severity = vim.diagnostic.severity.INFO, icon = "", highlight = "StatusLineDiagInfo" },
    { severity = vim.diagnostic.severity.HINT, icon = "󰌵", highlight = "StatusLineDiagHint" },
  }
  local parts = {}

  for _, item in ipairs(severities) do
    local count = #vim.diagnostic.get(bufnr, { severity = item.severity })

    if count > 0 then
      local highlight = active and item.highlight or "StatusLineMuted"

      table.insert(parts, table.concat({
        "%#",
        highlight,
        "#",
        item.icon,
        " ",
        count,
      }))
    end
  end

  if #parts == 0 then
    return ""
  end

  table.insert(parts, active and "%#StatusLineSurface#" or "%#StatusLineNC#")

  return table.concat(parts, " ")
end

local function lsp_section(bufnr, active)
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  if vim.tbl_isempty(clients) then
    return ""
  end

  local names = {}

  for _, client in ipairs(clients) do
    names[client.name] = true
  end

  local ordered_names = vim.tbl_keys(names)
  table.sort(ordered_names)

  local highlight = active and "%#StatusLineLsp#" or "%#StatusLineMuted#"

  return table.concat({
    highlight,
    " ",
    table.concat(ordered_names, ", "),
    active and "%#StatusLineSurface#" or "%#StatusLineNC#",
  })
end

local function filetype_section(bufnr, active)
  local filetype = vim.bo[bufnr].filetype

  if filetype == "" then
    filetype = "text"
  end

  local highlight = active and "%#StatusLineMuted#" or "%#StatusLineNC#"

  return table.concat({
    highlight,
    filetype,
  })
end

local function ruler_section(active)
  local highlight = active and "%#StatusLineAccent#" or "%#StatusLineMuted#"

  return table.concat({
    highlight,
    "%3l:%-2c",
    "%#StatusLineMuted#",
    "  ",
    "%2p%%",
  })
end

function M.render()
  local winid = vim.g.statusline_winid or vim.api.nvim_get_current_win()
  local bufnr = vim.api.nvim_win_get_buf(winid)
  local active = is_active(winid)
  local left = {
    mode_section(active),
    " ",
    filename_section(bufnr, active),
    git_section(bufnr, active),
  }
  local right = {}

  for _, section in ipairs({
    diagnostic_section(bufnr, active),
    lsp_section(bufnr, active),
    filetype_section(bufnr, active),
    ruler_section(active),
  }) do
    if section ~= "" then
      table.insert(right, section)
    end
  end

  return table.concat(left) .. "%=" .. table.concat(right, "  ")
end

function M.setup()
  setup_highlights()
  vim.o.statusline = "%!v:lua.require'config.statusline'.render()"

  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("user-statusline", { clear = true }),
    callback = setup_highlights,
  })
end

return M
