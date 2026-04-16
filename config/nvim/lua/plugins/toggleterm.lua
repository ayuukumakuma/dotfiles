local terminal_id = 1
local default_direction = "float"
local alternate_direction = "horizontal"
local current_direction = default_direction

local function toggleterm_terminal()
  return require("toggleterm.terminal").get_or_create_term(terminal_id, nil, current_direction)
end

local function toggle_terminal()
  local term = toggleterm_terminal()

  term:toggle(nil, current_direction)
end

local function next_direction(direction)
  if direction == alternate_direction then
    return default_direction
  end

  return alternate_direction
end

local function cycle_terminal_direction()
  local term = toggleterm_terminal()
  local direction = next_direction(term.direction or current_direction)

  current_direction = direction

  if term:is_open() then
    term:close()
  end

  term:open(nil, direction)
end

local function exit_terminal_mode()
  local keys = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true)

  vim.api.nvim_feedkeys(keys, "n", false)
end

local function from_terminal(action)
  return function()
    exit_terminal_mode()
    vim.schedule(action)
  end
end

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    {
      "<leader>t",
      toggle_terminal,
      desc = "Toggle terminal",
    },
    {
      "<leader>t",
      from_terminal(toggle_terminal),
      mode = "t",
      desc = "Toggle terminal",
    },
    {
      "<S-Esc>",
      cycle_terminal_direction,
      desc = "Cycle terminal layout",
    },
    {
      "<S-Esc>",
      from_terminal(cycle_terminal_direction),
      mode = "t",
      desc = "Cycle terminal layout",
    },
    {
      "<Esc>",
      "<C-\\><C-n>",
      mode = "t",
      desc = "Exit terminal mode",
    },
  },
  opts = {
    direction = default_direction,
    float_opts = {
      border = "rounded",
    },
    persist_mode = true,
    persist_size = true,
    shade_terminals = true,
    start_in_insert = true,
    terminal_mappings = false,
  },
}
