local M = {}

local function is_empty_buffer(bufnr)
  if vim.api.nvim_buf_get_name(bufnr) ~= "" or vim.bo[bufnr].buftype ~= "" then
    return false
  end

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)

  return vim.api.nvim_buf_line_count(bufnr) == 1 and (lines[1] or "") == ""
end

local function is_oil_buffer(bufnr)
  return vim.bo[bufnr].filetype == "oil"
end

local function should_show_intro(bufnr)
  return is_oil_buffer(bufnr) or is_empty_buffer(bufnr)
end

function M.show_intro_on_empty_startup()
  if vim.fn.argc() ~= 0 then
    return
  end

  local bufnr = vim.api.nvim_get_current_buf()
  local started_in_oil = is_oil_buffer(bufnr)

  if not should_show_intro(bufnr) then
    return
  end

  if started_in_oil then
    vim.cmd.enew()
    pcall(vim.api.nvim_buf_delete, bufnr, { force = true })
  end

  vim.cmd.intro()
end

function M.setup()
  local group = vim.api.nvim_create_augroup("user-startup-intro", { clear = true })

  vim.api.nvim_create_autocmd("VimEnter", {
    group = group,
    callback = function()
      vim.schedule(M.show_intro_on_empty_startup)
    end,
  })
end

return M
