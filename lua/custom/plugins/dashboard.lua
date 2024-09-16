-- A dashboard for Neovim, to get you started.
return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  enabled = false,
  init = function()
    vim.keymap.set('n', '<leader>\\', '<cmd>Dashboard<cr>', { desc = '[D]ashboard' })
  end,
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
        },
      },
    }
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
