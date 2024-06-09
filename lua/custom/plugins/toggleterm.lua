-- A terminal emulator for Neovim.
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    autochdir = true,
  },
  keys = {
    { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = '[T]oggle [T]erm' },
  },
}
