-- Formatting prettier etc.
return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'first' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    notify_no_formatters = true,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to
      -- run *until* a formatters is found.
      --
      astro = { 'prettierd' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      css = { 'prettierd' },
      scss = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      html = { 'prettierd' },
      jsonc = { 'prettierd' },
      json = { 'prettierd' },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
