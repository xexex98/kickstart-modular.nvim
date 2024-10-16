return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
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
