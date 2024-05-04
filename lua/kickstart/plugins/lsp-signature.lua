return {
  'ray-x/lsp_signature.nvim',
  event = 'VeryLazy',
  opts = {},
  config = function(_, opts)
    require('lsp_signature').setup(opts)
    vim.keymap.set({ 'n', 'i' }, '<C-s>', function()
      vim.lsp.buf.signature_help()
    end, { silent = true, noremap = true, desc = 'toggle signature' })
  end,
}
