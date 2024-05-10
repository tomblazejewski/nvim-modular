local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local null_ls = require 'null-ls'

local opts = {
  sources = {
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettier,
  },
  default_timeout = 10000,
  --   on_attach = function(client, bufnr)
  --     if client.supports_method 'textDocument/formatting' then
  --       vim.api.nvim_clear_autocmds {
  --         group = augroup,
  --         buffer = bufnr,
  --       }
  --       vim.api.nvim_create_autocmd('BufWritePre', {
  --         group = augroup,
  --         buffer = bufnr,
  --         callback = function()
  --           require('conform').format {
  --             timeout_ms = 100000,
  --             bufnr = bufnr,
  --             async = true,
  --             lsp_fallback = true,
  --           }
  --         end,
  --       })
  --     end
  --   end,
}

return opts
