local M = {}

local autosave_events = {
  "InsertLeave",
  "TextChanged",
}

local autoread_events = {
  "FocusGained",
  "BufEnter",
  "CursorHold",
}

local function should_autosave(bufnr)
  if vim.api.nvim_buf_get_name(bufnr) == "" then
    return false
  end

  if vim.bo[bufnr].buftype ~= "" then
    return false
  end

  if vim.bo[bufnr].readonly or not vim.bo[bufnr].modifiable then
    return false
  end

  return vim.bo[bufnr].modified
end

local function autosave(args)
  if not should_autosave(args.buf) then
    return
  end

  vim.cmd("silent write")
end

local function check_external_changes()
  if vim.bo.buftype ~= "" then
    return
  end

  vim.cmd.checktime()
end

function M.setup()
  local autosave_group = vim.api.nvim_create_augroup("user-autosave", { clear = true })
  local autoread_group = vim.api.nvim_create_augroup("user-autoread", { clear = true })

  vim.opt.autoread = true

  vim.api.nvim_create_autocmd(autosave_events, {
    group = autosave_group,
    callback = autosave,
  })

  vim.api.nvim_create_autocmd(autoread_events, {
    group = autoread_group,
    callback = check_external_changes,
  })
end

return M
