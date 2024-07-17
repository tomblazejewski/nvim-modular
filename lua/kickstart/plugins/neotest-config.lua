vim.keymap.set('n', '<leader>tc', function()
  require('neotest').run.run()
end, { desc = '[t]est [c]urrent function' })
vim.keymap.set('n', '<leader>tt', function()
  require('neotest').run.run(vim.fn.expand '%')
end, { desc = '[t]est file' })
require('neotest').setup {
  adapters = {
    require 'neotest-python' {
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = 'integratedTerminal',
      },
      args = { '--log-level', 'DEBUG', '--quiet' },
      runner = 'pytest',
      python = function(workspace)
        local lspconfig = require 'lspconfig'
        local util = lspconfig.util
        local path = util.path
        -- Use activated virtualenv.
        if vim.env.VIRTUAL_ENV then
          return path.join(vim.env.VIRTUAL_ENV, 'Scripts', 'python')
        end
        return path.join(vim.env.HOME, 'venvs', 'venv', 'Scripts', 'python')
      end,
    },
  },
}
