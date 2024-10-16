-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit insert mode
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exit insert mode' })

-- Delete current buffer
vim.keymap.set('n', 'Q', '<cmd>bd<CR>', { desc = 'Delete current buffer' })

-- Toggle wrap
vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<CR>', { desc = '[T]oggle [W]rap' })

-- Toggle relative number
vim.keymap.set('n', '<leader>tr', '<cmd>set relativenumber!<CR>', { desc = '[T]oggle [R]elative number' })

-- Toggle spell checking
vim.keymap.set('n', '<leader>ts', '<cmd>set spell!<CR>', { desc = '[T]oggle [S]pell checking' })

vim.keymap.set('n', '<leader>m', '<cmd>messages<cr>', { desc = '[M]essages' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Move selected lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down', noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up', noremap = true, silent = true })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<Left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<Right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<Up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<Down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Move wrapped lines to the next line
vim.keymap.set('n', 'j', function()
  return vim.v.count == 0 and vim.fn.mode()[0] ~= 'n' and vim.fn.mode()[0] ~= 'o' and 'gj' or 'j'
end, { expr = true })

vim.keymap.set('n', 'k', function()
  return vim.v.count == 0 and vim.fn.mode()[0] ~= 'n' and vim.fn.mode()[0] ~= 'o' and 'gk' or 'k'
end, { expr = true })

-- vim: ts=2 sts=2 sw=2 et
