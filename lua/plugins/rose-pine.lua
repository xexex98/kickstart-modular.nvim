return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'rose-pine-main'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
