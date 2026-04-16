local M = {}

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local special_buffer_labels = {
  help = "Help",
  nofile = "Scratch",
  prompt = "Prompt",
  quickfix = "Quickfix",
  terminal = "Terminal",
}

local file_icons = {
  gitcommit = "",
  help = "󰋖",
  lua = "󰢱",
  markdown = "󰍔",
  nix = "󱄅",
  terminal = "",
  toml = "󰰶",
  typescript = "󰛦",
  typescriptreact = "󰜈",
  yaml = "󰈙",
  yml = "󰈙",
  zsh = "",
}

local symbols = {
  bullet = "•",
  current = "󰄬",
  diagnostics = {
    ERROR = "󰅚",
    HINT = "󰌶",
    INFO = "󰋽",
    WARN = "󰀪",
  },
  file = "󰈔",
  lock = "󰌾",
  modified = "󰐖",
  mode = "󰖯",
  ruler = "",
  scroll = "󰇙",
  tab = "󰓩",
  terminal = "",
  trunc_left = "󰇘",
  trunc_right = "󰇙",
}

local mode_names = {
  ["!"] = "SHELL",
  ["\19"] = "S-BLOCK",
  ["\22"] = "V-BLOCK",
  ["\22s"] = "V-BLOCK",
  R = "REPLACE",
  Rc = "REPLACE",
  Rv = "V-REPLACE",
  Rvc = "V-REPLACE",
  Rvx = "V-REPLACE",
  Rx = "REPLACE",
  S = "S-LINE",
  V = "V-LINE",
  Vs = "V-LINE",
  c = "COMMAND",
  cv = "EX",
  i = "INSERT",
  ic = "INSERT",
  ix = "INSERT",
  n = "NORMAL",
  niI = "NORMAL",
  niR = "NORMAL",
  niV = "NORMAL",
  no = "N-PENDING",
  ["no\22"] = "N-PENDING",
  noV = "N-PENDING",
  nov = "N-PENDING",
  nt = "NORMAL",
  ntT = "NORMAL",
  r = "PROMPT",
  ["r?"] = "CONFIRM",
  rm = "MORE",
  s = "SELECT",
  t = "TERMINAL",
  v = "VISUAL",
  vs = "VISUAL",
}

local function get_colors()
  local ok, palettes = pcall(require, "catppuccin.palettes")

  if not ok then
    return {
      bg = "#eff1f5",
      blue = "#1e66f5",
      green = "#40a02b",
      mantle = "#e6e9ef",
      mauve = "#8839ef",
      muted = "#6c6f85",
      peach = "#fe640b",
      red = "#d20f39",
      sky = "#04a5e5",
      surface = "#ccd0da",
      text = "#4c4f69",
      yellow = "#df8e1d",
    }
  end

  local palette = palettes.get_palette("latte")

  return {
    bg = palette.base,
    blue = palette.blue,
    green = palette.green,
    mantle = palette.mantle,
    mauve = palette.mauve,
    muted = palette.subtext0,
    peach = palette.peach,
    red = palette.red,
    sky = palette.sky,
    surface = palette.surface0,
    text = palette.text,
    yellow = palette.yellow,
  }
end

local function current_mode()
  return vim.fn.mode(1)
end

local function mode_label()
  return mode_names[current_mode()] or current_mode():upper()
end

local function mode_color()
  local mode = current_mode()
  local colors = get_colors()

  if mode:match("^i") then
    return colors.green
  end

  if mode:match("^[vV\22]") then
    return colors.mauve
  end

  if mode:match("^R") then
    return colors.red
  end

  if mode:match("^[sS\19]") then
    return colors.peach
  end

  if mode:match("^c") then
    return colors.yellow
  end

  if mode:match("^t") then
    return colors.sky
  end

  return colors.blue
end

local function is_special_buffer(bufnr)
  return vim.bo[bufnr].buftype ~= ""
end

local function executable_name(command)
  local executable = vim.split(command, " ", { plain = true })[1]

  if executable and executable ~= "" then
    return vim.fn.fnamemodify(executable, ":t")
  end
end

local function terminal_process_name(bufnr)
  local term_title = vim.b[bufnr].term_title

  if type(term_title) == "string" and term_title ~= "" then
    local name = executable_name(term_title)

    if name then
      return name
    end
  end

  local tail = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
  local toggleterm_name = tail:match("^(.-);#toggleterm#%d+$")

  if toggleterm_name and toggleterm_name ~= "" then
    tail = toggleterm_name
  end

  local command = tail:match("^%d+:(.+)$") or tail
  local name = executable_name(command)

  if name then
    return name
  end

  return special_buffer_labels.terminal
end

local function buffer_label(bufnr)
  if vim.bo[bufnr].buftype == "terminal" then
    return terminal_process_name(bufnr)
  end

  local bufname = vim.api.nvim_buf_get_name(bufnr)

  if bufname ~= "" then
    return vim.fn.fnamemodify(bufname, ":t")
  end

  local filetype = vim.bo[bufnr].filetype
  local buftype = vim.bo[bufnr].buftype

  return special_buffer_labels[buftype]
    or (filetype ~= "" and filetype)
    or "[No Name]"
end

local function buffer_path(bufnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)

  if bufname == "" then
    return buffer_label(bufnr)
  end

  return vim.fn.fnamemodify(bufname, ":~:.")
end

local function file_icon(bufnr)
  local buftype = vim.bo[bufnr].buftype

  if buftype == "terminal" then
    return symbols.terminal
  end

  return file_icons[vim.bo[bufnr].filetype] or symbols.file
end

local function format_path(path)
  local parts = vim.split(path, "/", { trimempty = true })

  if path:sub(1, 1) == "/" then
    return "/" .. table.concat(parts, " / ")
  end

  return table.concat(parts, " / ")
end

local function listed_buffers()
  local bufs = {}

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted and not is_special_buffer(bufnr) then
      table.insert(bufs, bufnr)
    end
  end

  table.sort(bufs)

  return bufs
end

local function disable_winbar(args)
  local bufnr = args.buf

  if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
    return false
  end

  return is_special_buffer(bufnr)
end

local function pill(component, background, foreground)
  local function resolve(value)
    if type(value) == "function" then
      return value()
    end

    return value
  end

  return {
    {
      provider = "",
      hl = function()
        return { fg = resolve(background) }
      end,
    },
    {
      component,
      hl = function()
        return {
          bg = resolve(background),
          fg = resolve(foreground),
        }
      end,
    },
    {
      provider = "",
      hl = function()
        return { fg = resolve(background) }
      end,
    },
  }
end

local Align = { provider = "%=" }

local ViMode = {
  provider = function()
    return " " .. symbols.mode .. " " .. mode_label() .. " "
  end,
  hl = function()
    return {
      bg = mode_color(),
      bold = true,
      fg = "bg",
    }
  end,
  update = {
    "BufEnter",
    "ModeChanged",
    "WinEnter",
  },
}

local FileName = {
  init = function(self)
    self.bufnr = vim.api.nvim_get_current_buf()
    self.icon = file_icon(self.bufnr)
    self.name = buffer_label(self.bufnr)
    self.path = buffer_path(self.bufnr)
  end,
  flexible = 2,
  {
    provider = function(self)
      return " " .. self.icon .. " " .. self.path .. " "
    end,
  },
  {
    provider = function(self)
      return " " .. self.icon .. " " .. self.name .. " "
    end,
  },
}

local FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = function()
      return " " .. symbols.modified
    end,
    hl = { fg = "yellow", bold = true },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = function()
      return " " .. symbols.lock
    end,
    hl = { fg = "peach", bold = true },
  },
}

local Diagnostics = {
  condition = conditions.has_diagnostics,
  static = {
    severities = { "ERROR", "WARN", "INFO", "HINT" },
  },
  init = function(self)
    self.counts = {}

    for _, severity in ipairs(self.severities) do
      self.counts[severity] = #vim.diagnostic.get(0, {
        severity = vim.diagnostic.severity[severity],
      })
    end
  end,
  update = {
    "BufEnter",
    "DiagnosticChanged",
  },
  {
    provider = function(self)
      if self.counts.ERROR == 0 then
        return ""
      end

      return " " .. symbols.diagnostics.ERROR .. " " .. self.counts.ERROR
    end,
    hl = { fg = "red" },
  },
  {
    provider = function(self)
      if self.counts.WARN == 0 then
        return ""
      end

      return " " .. symbols.diagnostics.WARN .. " " .. self.counts.WARN
    end,
    hl = { fg = "yellow" },
  },
  {
    provider = function(self)
      if self.counts.INFO == 0 then
        return ""
      end

      return " " .. symbols.diagnostics.INFO .. " " .. self.counts.INFO
    end,
    hl = { fg = "blue" },
  },
  {
    provider = function(self)
      if self.counts.HINT == 0 then
        return ""
      end

      return " " .. symbols.diagnostics.HINT .. " " .. self.counts.HINT
    end,
    hl = { fg = "sky" },
  },
  {
    provider = " ",
  },
}

local FileType = {
  provider = function()
    local filetype = vim.bo.filetype

    if filetype == "" then
      return ""
    end

    return " " .. string.upper(filetype) .. " "
  end,
  hl = { fg = "muted" },
}

local Ruler = {
  provider = function()
    return " " .. symbols.ruler .. " %l:%c "
  end,
  hl = { fg = "text" },
}

local Scroll = {
  provider = function()
    local current = vim.fn.line(".")
    local total = vim.fn.line("$")

    if current <= 1 then
      return " " .. symbols.scroll .. " Top "
    end

    if current >= total then
      return " " .. symbols.scroll .. " Bot "
    end

    return string.format(" %s %2d%%%% ", symbols.scroll, math.floor((current / total) * 100))
  end,
  hl = { fg = "muted" },
}

local ActiveWinbarPath = {
  init = function(self)
    self.icon = file_icon(0)
    self.path = buffer_path(0)
  end,
  {
    provider = function(self)
      return " " .. self.icon .. " " .. format_path(self.path)
    end,
    hl = { fg = "text", bold = true },
  },
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = function()
      return " " .. symbols.modified
    end,
    hl = { fg = "yellow", bold = true },
  },
}

local InactiveWinbarPath = {
  provider = function()
    return " " .. symbols.file .. " " .. buffer_label(0)
  end,
  hl = { fg = "muted" },
}

local WinBar = {
  fallthrough = false,
  {
    condition = conditions.is_active,
    ActiveWinbarPath,
  },
  InactiveWinbarPath,
}

local BufferBlock = {
  init = function(self)
    self.icon = file_icon(self.bufnr)
    self.label = buffer_label(self.bufnr)
    self.path = buffer_path(self.bufnr)
  end,
  flexible = 2,
  on_click = {
    callback = function(_, minwid)
      if vim.api.nvim_buf_is_valid(minwid) then
        vim.api.nvim_win_set_buf(0, minwid)
      end
    end,
    minwid = function(self)
      return self.bufnr
    end,
    name = "heirline_buffer_click_callback",
  },
  {
    provider = function(self)
      local marker = self.is_active and symbols.current or symbols.bullet
      local modified = vim.bo[self.bufnr].modified and " " .. symbols.modified or ""

      return string.format(" %s %s %s%s ", marker, self.icon, self.path, modified)
    end,
  },
  {
    provider = function(self)
      local marker = self.is_active and symbols.current or symbols.bullet
      local modified = vim.bo[self.bufnr].modified and " " .. symbols.modified or ""

      return string.format(" %s %s %s%s ", marker, self.icon, self.label, modified)
    end,
  },
  hl = function(self)
    if self.is_active then
      return { fg = "bg", bg = "blue", bold = true }
    end

    if self.is_visible then
      return { fg = "text", bg = "surface" }
    end

    return { fg = "muted", bg = "mantle" }
  end,
}

local BufferList = utils.make_buflist(
  BufferBlock,
  {
    provider = " " .. symbols.trunc_left .. " ",
    hl = { fg = "muted" },
  },
  {
    provider = " " .. symbols.trunc_right .. " ",
    hl = { fg = "muted" },
  },
  listed_buffers
)

local TabPagesSummary = {
  provider = function()
    return string.format(" %s %d/%d ", symbols.tab, vim.fn.tabpagenr(), vim.fn.tabpagenr("$"))
  end,
}

local TabLine = {
  pill(BufferList, "mantle", "text"),
  Align,
  pill(TabPagesSummary, "surface", "muted"),
}

local StatusLine = {
  pill(ViMode, mode_color, "bg"),
  pill(FileName, "surface", "text"),
  FileFlags,
  Align,
  pill(Diagnostics, "mantle", "text"),
  pill(FileType, "surface", "muted"),
  pill(Ruler, "mantle", "text"),
  pill(Scroll, "surface", "muted"),
}

function M.setup()
  local heirline = require("heirline")

  heirline.setup({
    statusline = StatusLine,
    tabline = TabLine,
    winbar = WinBar,
    opts = {
      colors = get_colors,
      disable_winbar_cb = disable_winbar,
    },
  })
end

return M
