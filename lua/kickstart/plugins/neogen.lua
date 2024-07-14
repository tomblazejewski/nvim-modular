return {
  'danymat/neogen',
  config = function()
    require('neogen').setup {
      languages = {
        python = {
          template = {
            annotation_convention = 'reST',
          },
        },
      },
    }
    vim.api.nvim_set_keymap('i', '<C-n>', ":lua require('neogen').jump_next<CR>", { desc = '[N]revious placeholder' })
    vim.api.nvim_set_keymap('i', '<C-p>', ":lua require('neogen').jump_prev<CR>", { desc = '[P]revious placeholder' })
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
