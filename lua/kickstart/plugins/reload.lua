vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  callback = function()
    vim.cmd 'checktime'
  end,
})
