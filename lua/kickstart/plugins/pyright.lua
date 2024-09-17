local lspconfig = require 'lspconfig'
local util = lspconfig.util
local path = util.path
local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'Scripts', 'python')
  end
  return path.join(vim.env.HOME, 'venvs', 'venv', 'Scripts', 'python')
end

lspconfig.pyright.setup {
  settings = {
    python = {
      analysis = {
        diagnosticMode = 'openFilesOnly',
      },
    },
  },
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end,
}
