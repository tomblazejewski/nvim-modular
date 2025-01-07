local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local null_ls = require 'null-ls'
local flake8 = require 'none-ls.diagnostics.flake8'
local ruff = require 'none-ls.diagnostics.ruff'
vim.diagnostic.config {
  virtual_text = {
    source = true,
    prefix = function(diagnostic)
      return diagnostic.code
    end,
  },
  update_in_insert = true,
}
local opts = {
  sources = {
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.mypy,
    -- flake8.with {
    --   '--max-line-length=120',
    --   '--max-complexity=18',
    --   '--select',
    --   'D',
    --   '--ignore=D400,D212,D205,D203,D210,D401',
    --   '--exclude=.cache,tests/, venv',
    --   '--docstring-convention=all',
    --   '--ignore-decorators=overrides',
    -- },
  },
  ruff.with {
    '--config',
    'C:/Repos/pyproject.toml',
  },
  --   .with {
  --     extra_args = {
  --       '--max-line-length=120',
  --       '--max-complexity=18',
  --       '--select=D',
  --       '--ignore=D400,D212,D205,D203,D210,D401',
  --       '--exclude=.cache,tests/',
  --       '--docstring-convention=all',
  --       '--ignore-decorators=overrides',
  --     },
  --   },
  -- },
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
