-- fzf-lua ultrafast fuzzy finder
-- https://github.com/ibhagwan/fzf-lua

return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local fzf = require 'fzf-lua'
    local config = require 'fzf-lua.config'

    config.defaults.actions.files['ctrl-t'] = require('trouble.sources.fzf').actions.open

    fzf.setup {
      fzf_opts = { ['--layout'] = 'reverse-list' },
      keymap = {
        fzf = {
          ['tab'] = 'down',
          ['shift-tab'] = 'up',
          ['ctrl-z'] = 'abort',
          ['ctrl-u'] = 'unix-line-discard',
          ['ctrl-f'] = 'half-page-down',
          ['ctrl-b'] = 'half-page-up',
          ['ctrl-a'] = 'beginning-of-line',
          ['ctrl-e'] = 'end-of-line',
          ['alt-a'] = 'toggle-all',
          ['alt-g'] = 'last',
          ['alt-G'] = 'first',
          -- Only valid with fzf previewers (bat/cat/git/etc)
          ['f3'] = 'toggle-preview-wrap',
          ['f4'] = 'toggle-preview',
          ['shift-down'] = 'preview-page-down',
          ['shift-up'] = 'preview-page-up',
          ['alt-shift-down'] = 'preview-down',
          ['alt-shift-up'] = 'preview-up',
        },
        builtin = {
          ['<M-Esc>'] = 'hide',
          ['<F1>'] = 'toggle-help',
          ['<F2>'] = 'toggle-fullscreen',
          -- Only valid with the 'builtin' previewer
          ['<F3>'] = 'toggle-preview-wrap',
          ['<F4>'] = 'toggle-preview',
          ['<F5>'] = 'toggle-preview-ccw',
          ['<F6>'] = 'toggle-preview-cw',
          ['<C-d>'] = 'preview-page-down',
          ['<C-u>'] = 'preview-page-up',
          ['<M-S-down>'] = 'preview-down',
          ['<M-S-up>'] = 'preview-up',
        },
      },
    }

    vim.keymap.set('n', '<leader>sf', function()
      fzf.files { fd_opts = [[--color=never --type f --hidden --follow --exclude .git]] }
    end, { desc = '[S]earch [f]iles', noremap = true, silent = true })

    vim.keymap.set('n', '<leader>sP', function()
      fzf.files { cwd = vim.fn.fnamemodify(vim.uv.cwd(), ':h'), winopts = { title = 'Search files in parent directory' } }
    end, { desc = '[S]earch files in [P]arent directory', noremap = true, silent = true })

    vim.keymap.set('n', '<leader>ss', fzf.builtin, { desc = '[S]earch [S]elect builtins', noremap = true, silent = true })

    vim.keymap.set('n', '<leader><leader>', function()
      fzf.buffers {}
    end, { desc = '[ ] Find existing buffers', noremap = true, silent = true })

    vim.keymap.set('n', '<leader>sw', function()
      fzf.grep_cword {
        rg_opts = '--hidden --glob "!.git/" --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e',
        winopts = { title = 'Search current word' },
      }
    end, { desc = '[S]earch current [W]ord', noremap = true, silent = true })

    vim.keymap.set('n', '<leader>sg', function()
      fzf.live_grep {
        path_shorten = true,
        winopts = { title = 'Live Grep in Current Directory ' },
      }
    end, { desc = '[S]earch live [G]rep', noremap = true, silent = true })

    vim.keymap.set('n', '<leader>sG', function()
      fzf.live_grep { cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ':h'), winopts = { title = 'Live Grep in Parent Directory' } }
    end, { desc = '[S]earch by [G]rep in Parent Directory', noremap = true, silent = true })

    vim.keymap.set('n', '<leader>sd', function()
      fzf.diagnostics_document {}
    end, { desc = '[S]earch [D]iagnostics', noremap = true, silent = true })

    vim.keymap.set('n', '<leader>sr', function()
      fzf.resume {}
    end, { desc = '[S]earch [R]esume', noremap = true, silent = true })

    vim.keymap.set('n', '<leader>s.', function()
      fzf.oldfiles {}
    end, { desc = '[S]earch Recent Files', noremap = true, silent = true })

    vim.keymap.set('n', '<leader>/', function()
      fzf.lgrep_curbuf { winopts = { title = 'Live Grep in current buffer' } }
    end, { desc = '[/] Live grep in current buffer', noremap = true, silent = true })

    vim.keymap.set('n', '<leader>sn', function()
      fzf.files { cwd = vim.fn.stdpath 'config', winopts = { title = 'Neovim config files' } }
    end, { desc = '[S]earch [N]eovim files', noremap = true, silent = true })
    vim.keymap.set('n', '<leader>sp', function()
      fzf.fzf_exec("fd '.git$' --hidden --prune -utd ~/yandex  | xargs dirname", {
        actions = {
          ['default'] = function(selected, _)
            fzf.git_files { cwd = selected[1] }
          end,
        },
      })
    end, { desc = '[S]earch [P]rojects', noremap = true, silent = true })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
