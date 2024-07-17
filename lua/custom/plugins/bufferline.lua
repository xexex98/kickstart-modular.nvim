-- A bufferline for Neovim, to help you navigate between buffers.
return {
  'akinsho/bufferline.nvim',
  lazy = false,
  -- stylua: ignore
  keys = {
    { '<Tab>',      '<Cmd>BufferLineCycleNext<CR>', desc = 'Next tab' },
    { '<S-Tab>',    '<Cmd>BufferLineCyclePrev<CR>', desc = 'Prev tab' },
    { '<Esc><Esc>', '<Cmd>bd<CR>',                  desc = 'Delete current buffer' },
    { '<leader>X',    '<Cmd>bd!<CR>',                 desc = 'Delete current buffer without saving' },
  },
  opts = {
    options = {
      mode = 'buffers',
      show_buffer_close_icons = true,
      show_close_icon = true,
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
