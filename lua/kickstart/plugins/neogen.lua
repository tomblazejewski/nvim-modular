return {
  'danymat/neogen',
  config = function()
    local neogen = require 'neogen'
    neogen.setup {
      languages = {
        python = {
          template = {
            annotation_convention = 'reST',
          },
        },
      },
    }

    vim.keymap.set('n', '<leader>dd', neogen.generate, { desc = '[D]ocumentation [d]ocs' })
    vim.keymap.set('i', '<C-n>', neogen.jump_next, { desc = '[N]ext placeholder' })
    vim.keymap.set('i', '<C-p>', neogen.jump_prev, { desc = '[P]revious placeholder' })
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
