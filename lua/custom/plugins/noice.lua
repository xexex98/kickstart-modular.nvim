-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>nl', '<cmd>Noice<cr>', desc = '[N]oice [L]ast' },
    { '<leader>nh', '<cmd>Noice history<cr>', desc = '[N]oice [H]istory' },
    { '<leader>nt', '<cmd>Noice telescope<cr>', desc = '[N]oice [T]elescope' },
  },
  opts = {
    routes = {
      view = 'mini',
    },
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      -- use a classic bottom cmdline for search
      command_palette = true,
      -- position the cmdline and popupmenu together
      bottom_search = true,
      -- long messages will be sent to a split
      long_message_to_split = true,
      -- enables an input dialog for inc-rename.nvim
      inc_rename = false,
      -- add a border to hover docs and signature help
      lsp_doc_border = false,
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL: `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- { 'rcarriga/nvim-notify', opts = { timeout = 3000 } },
  },
}
