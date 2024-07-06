return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gbf', function()
      vim.cmd 'LspLensOff'
      vim.cmd 'Git blame'
    end, { desc = '[G]it [B]lame [F]ile' })
    vim.keymap.set('n', '<leader>gbe', function()
      vim.cmd 'q'
      vim.cmd 'LspLensOn'
    end, { desc = '[G]it [B]lame [E]xit' })
  end,
}
