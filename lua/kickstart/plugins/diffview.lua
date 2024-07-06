return {
  'sindrets/diffview.nvim',
  config = function()
    vim.keymap.set('n', '<leader>gdf', ':DiffviewFileHistory % <cr>', { desc = '[G]it [D]iff [F]ile' })
  end,
}
