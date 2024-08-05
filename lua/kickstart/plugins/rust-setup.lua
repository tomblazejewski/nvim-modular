local on_attach = function(client, bufnr)
  --- Only Neovim 0.7
  if client.resolved_capabilities.code_lens then
    local codelens = vim.api.nvim_create_augroup('LSPCodeLens', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter' }, {
      group = codelens,
      callback = function()
        vim.lsp.codelens.refresh()
      end,
      buffer = bufnr,
      once = true,
    })
    vim.api.nvim_create_autocmd({ 'BufWritePost', 'CursorHold' }, {
      group = codelens,
      callback = function()
        vim.lsp.codelens.refresh()
      end,
      buffer = bufnr,
    })
  end
end
