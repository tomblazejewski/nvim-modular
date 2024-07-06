return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
  },
  opts = function()
    return require 'kickstart.plugins.none-ls-config'
  end,
}
