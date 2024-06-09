-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'kevinhwang91/nvim-ufo',
    event = 'VeryLazy',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require('ufo').setup {}
      vim.o.foldcolumn = '0' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    end,
  },

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
