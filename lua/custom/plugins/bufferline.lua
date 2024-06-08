return {
  'akinsho/bufferline.nvim',
  lazy = false,
  keys = {
    { '<Tab>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next tab' },
    { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Prev tab' },
    { '<leader>x', '<Cmd>bd<CR>', desc = 'Delete current buffer' },
  },
  opts = {
    options = {
      show_buffer_close_icons = true,
      show_close_icon = true,
    },
  },
}
