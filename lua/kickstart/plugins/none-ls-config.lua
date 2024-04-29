local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local null_ls = require 'null-ls'

local opts = {
  sources = {
    null_ls.builtins.formatting.isort.with { timeout = -1 },
    null_ls.builtins.formatting.black.with { timeout = -1 },
  },
  default_timeout = -1,
  on_attach = function(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format {
            timeout_ms = 10000,
            bufnr = bufnr,
          }
        end,
      })
    end
  end,
}

return opts
