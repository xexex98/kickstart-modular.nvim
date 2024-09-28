-- Code write helper like Copilot.
return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    vim.keymap.set('i', '<s-tab>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })
  end,
}
