-- Code write helper like Copilot.
return {
  'supermaven-inc/supermaven-nvim',
  event = 'InsertEnter',
  config = function()
    require('supermaven-nvim').setup {
      keymaps = {
        accept_suggestion = '<s-tab>',
      },
    }
  end,
}
