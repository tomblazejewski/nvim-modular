return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
{ "<leader>jj", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
 { "<leader>jt", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
 { "<leader>jr", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
 { "<leader>js", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
 { "<leader>jf", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
 },
}
