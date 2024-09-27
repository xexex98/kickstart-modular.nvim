-- fzf-lua ultrafast fuzzy finder
return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local fzf = require 'fzf-lua'

    fzf.setup { 'telescope', fzf_opts = { ['--layout'] = 'reverse-list' } }

    vim.keymap.set('n', '<leader>sf', function()
      fzf.files { fd_opts = [[--color=never --type f --hidden --follow --exclude .git]] }
    end, { desc = '[S]earch [f]iles', noremap = true, silent = true })

    vim.keymap.set('n', '<leader>sP', function()
      fzf.files { cwd = vim.fn.fnamemodify(vim.uv.cwd(), ':h'), winopts = { title = 'Search files in parent directory' } }
    end, { desc = '[S]earch files in [P]arent directory' })

    vim.keymap.set('n', '<leader>ss', fzf.builtin, { desc = '[S]earch [S]elect builtins' })

    vim.keymap.set('n', '<leader><leader>', function()
      fzf.buffers {}
    end, { desc = '[ ] Find existing buffers', noremap = true, silent = true })

    vim.keymap.set('n', '<leader>sw', function()
      fzf.grep_cword {
        rg_opts = '--hidden --glob "!.git/" --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e',
        winopts = { title = 'Search current word' },
      }
    end, { desc = '[S]earch current [W]ord' })

    vim.keymap.set('n', '<leader>sg', function()
      fzf.live_grep { winopts = { title = 'Live Grep' } }
    end, { desc = '[S]earch live [G]rep' })

    vim.keymap.set('n', '<leader>sG', function()
      fzf.live_grep { cwd = vim.fn.fnamemodify(vim.uv.cwd(), ':h'), winopts = { title = 'Live Grep in Parent Directory' } }
    end, { desc = '[S]earch by [G]rep in Parent Directory' })

    vim.keymap.set('n', '<leader>sd', function()
      fzf.diagnostics_document {}
    end, { desc = '[S]earch [D]iagnostics' })

    vim.keymap.set('n', '<leader>sr', function()
      fzf.resume {}
    end, { desc = '[S]earch [R]esume' })

    vim.keymap.set('n', '<leader>s.', function()
      fzf.oldfiles {}
    end, { desc = '[S]earch Recent Files' })

    vim.keymap.set('n', '<leader>/', function()
      fzf.lgrep_curbuf { winopts = { title = 'Live Grep in current buffer' } }
    end, { desc = '[/] Live grep in current buffer' })

    vim.keymap.set('n', '<leader>sn', function()
      fzf.files { cwd = vim.fn.stdpath 'config', winopts = { title = 'Neovim config files' } }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
--   vim.keymap.set('n', '<leader>sp', function()
--     require('telescope').extensions.projects.projects()
--   end, { desc = '[S]earch [P]rojects' })
