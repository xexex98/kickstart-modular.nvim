-- A smooth scrolling neovim plugin written in lua.
return {
  'karb94/neoscroll.nvim',
  event = 'VeryLazy',
  config = function()
    require('neoscroll').setup {
      easing = 'sine',
    }
  end,
}
