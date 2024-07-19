-- Formatting prettier etc.
return {
  'stevearc/conform.nvim',
  event = 'VeryLazy',
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
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to
      -- run *until* a formatters is found.
      --
      astro = { { 'prettierd', 'prettier' } },
      javascript = { { 'prettierd', 'prettier' } },
      typescript = { { 'prettierd', 'prettier' } },
      css = { { 'prettierd', 'prettier' } },
      scss = { { 'prettierd', 'prettier' } },
      javascriptreact = { { 'prettierd', 'prettier' } },
      typescriptreact = { { 'prettierd', 'prettier' } },
      html = { { 'prettierd', 'prettier' } },
      jsonc = { { 'prettierd', 'prettier' } },
      json = { { 'prettierd', 'prettier' } },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
