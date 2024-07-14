return {
  'sindrets/diffview.nvim',
  config = function()
    vim.keymap.set('n', '<leader>gdf', ':DiffviewFileHistory % <cr>', { desc = '[G]it [D]iff [F]ile' })
    vim.keymap.set('n', '<leader>gdo', ':DiffviewOpen<cr>', { desc = '[G]it [D]iffView [O]pen' })
    vim.keymap.set('n', '<leader>gdc', ':DiffviewClose<cr>', { desc = '[G]it [D]iffView [C]lose' })
  end,
}
