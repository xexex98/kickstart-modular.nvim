-- A plugin to help you manage your projects.
return {
  'ahmedkhalf/project.nvim',
  event = 'VeryLazy',
  config = function()
    require('project_nvim').setup {
      scope_chdir = 'global',
      silent_chdir = false,
      detection_methods = { 'pattern', 'lsp' },
    }
  end,
}
