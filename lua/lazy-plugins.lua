-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- modular approach: using `require 'path/name'` will
  -- include a plugin definition from file lua/path/name.lua

  require 'kickstart/plugins/gitsigns',

  require 'kickstart/plugins/which-key',

  require 'kickstart/plugins/telescope',

  require 'kickstart/plugins/lspconfig',

  require 'kickstart/plugins/conform',

  require 'kickstart/plugins/cmp',

  require 'kickstart/plugins/todo-comments',

  require 'kickstart/plugins/mini',

  require 'kickstart/plugins/treesitter',
  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --

  require 'kickstart.plugins.debug-new',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.catppuccin',
  require 'kickstart.plugins.bufferline',
  require 'kickstart.plugins.nvim-comment',
  require 'kickstart.plugins.autosession',
  require 'kickstart.plugins.lsp-lens',
  require 'kickstart.plugins.none-ls',
  -- require 'kickstart.plugins.lsp-signature', this provides function argument hints and documentation but lsp docs + nvim lsp signature help in cmp give better positioning of things
  require 'kickstart.plugins.fugitive',
  require 'kickstart.plugins.precognition',
  require 'kickstart.plugins.oil',
  -- require 'kickstart.plugins.notify',
  require 'kickstart.plugins.diffview',
  require 'kickstart.plugins.hardtime',
  require 'kickstart.plugins.neogen',
  require 'kickstart.plugins.flash',
  require 'kickstart.plugins.neotest',
  require 'kickstart.plugins.actions-preview',
  require 'kickstart.plugins.rust',
  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
--activate bufferline
require('bufferline').setup {}
--configure the right venv for pyright
require 'kickstart.plugins.pyright'
--activate lsp lens
require('lsp-lens').setup {}
--activate lsp-signature
-- require('lsp_signature').setup {}
-- turn on debugging for none-ls
require('null-ls').setup {
  debug = true,
}
--activate oil
require('oil').setup()
--activate notify
-- require('noice').setup {
--   lsp = {
--     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--     override = {
--       ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
--       ['vim.lsp.util.stylize_markdown'] = true,
--       ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
--     },
--   },
-- you can enable a preset for easier configuration
-- presets = {
--   bottom_search = true, -- use a classic bottom cmdline for search
--   command_palette = true, -- position the cmdline and popupmenu together
--   long_message_to_split = true, -- long messages will be sent to a split
--   inc_rename = false, -- enables an input dialog for inc-rename.nvim
--   lsp_doc_border = false, -- add a border to hover docs and signature help
-- },
-- cmdline = {
-- view = 'cmdline',
-- },
-- }
--workaround from https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes to try to fix auto sessions with neo-tree
require 'kickstart.plugins.neotest-config'
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = 'NvimTree*',
  callback = function()
    local api = require 'nvim-tree.api'
    local view = require 'nvim-tree.view'

    if not view.is_visible() then
      api.tree.open()
    end
  end,
})
-- workaround so that neotree isn't left as the last buffer
vim.api.nvim_create_autocmd('QuitPre', {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match 'NvimTree_' ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(invalid_win) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end,
})
require 'kickstart.plugins.rust-setup'
require 'kickstart.plugins.reload'
-- vim: ts=2 sts=2 sw=2 et
