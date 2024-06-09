-- Highlight matching parentheses, brackets, etc.
return {
  'andymass/vim-matchup',
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = 'popup' }
  end,
}
