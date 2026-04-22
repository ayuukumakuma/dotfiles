local markdown_preview_augroup = vim.api.nvim_create_augroup("markdown_preview", { clear = true })

local function get_markview_state()
  return require("markview.state")
end

local function get_markview_actions()
  return require("markview.actions")
end

local function get_markview_preview_window(state)
  return state.get_splitview_window({}, false)
end

local function is_markdown_file_buffer(buf)
  return vim.api.nvim_buf_is_valid(buf)
    and vim.bo[buf].filetype == "markdown"
    and vim.bo[buf].buftype == ""
    and vim.api.nvim_buf_get_name(buf) ~= ""
end

local function is_normal_edit_window(win)
  if not vim.api.nvim_win_is_valid(win) then
    return false
  end

  local config = vim.api.nvim_win_get_config(win)
  local buf = vim.api.nvim_win_get_buf(win)

  return config.relative == "" and vim.bo[buf].buftype == ""
end

local function is_markview_preview_window(win)
  local state = get_markview_state()

  return win == get_markview_preview_window(state)
end

local function close_markdown_preview()
  local state = get_markview_state()

  if state.get_splitview_source() then
    pcall(get_markview_actions().splitClose)
  end
end

local function close_preview_if_source_disappeared(buf)
  local state = get_markview_state()

  if state.get_splitview_source() ~= buf then
    return
  end

  vim.schedule(function()
    if not vim.api.nvim_buf_is_valid(buf) or #vim.fn.win_findbuf(buf) == 0 then
      close_markdown_preview()
    end
  end)
end

local function sync_markdown_preview(win)
  local state = get_markview_state()

  if not state.win_safe(win) or is_markview_preview_window(win) or not is_normal_edit_window(win) then
    return
  end

  local buf = vim.api.nvim_win_get_buf(win)

  if not is_markdown_file_buffer(buf) then
    return
  end

  if state.get_splitview_source() == buf and state.win_safe(get_markview_preview_window(state)) then
    return
  end

  pcall(get_markview_actions().splitOpen, buf)
end

local function setup_markdown_preview_autocmds()
  vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
    group = markdown_preview_augroup,
    callback = function()
      sync_markdown_preview(vim.api.nvim_get_current_win())
    end,
  })

  vim.api.nvim_create_autocmd("BufWinLeave", {
    group = markdown_preview_augroup,
    callback = function(args)
      close_preview_if_source_disappeared(args.buf)
    end,
  })

  vim.api.nvim_create_autocmd("WinClosed", {
    group = markdown_preview_augroup,
    callback = function()
      local state = get_markview_state()
      local source = state.get_splitview_source()

      if source then
        close_preview_if_source_disappeared(source)
      end
    end,
  })
end

return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = {
    "saghen/blink.cmp",
  },
  opts = {
    preview = {
      splitview_winopts = {
        split = "right",
      },
    },
  },
  config = function(_, opts)
    require("markview").setup(opts)
    setup_markdown_preview_autocmds()
  end,
}
