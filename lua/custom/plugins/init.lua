-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    init = function()
      vim.g.VM_maps = {
        ['Find Under'] = '<C-n>',
      }
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "[F]lash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "[F]lash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  require 'custom.plugins.ufo',
  require 'custom.plugins.trouble',
  require 'custom.plugins.matchup',
  require 'custom.plugins.project',
  require 'custom.plugins.neoscroll',
  require 'custom.plugins.noice',
  require 'custom.plugins.toggleterm',
  require 'custom.plugins.lualine',
  require 'custom.plugins.lazygit',
  require 'custom.plugins.bufferline',
  require 'custom.plugins.dashboard',
  require 'custom.plugins.supermaven',
}
