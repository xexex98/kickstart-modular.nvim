return {
  'kevinhwang91/nvim-ufo',
  event = 'VeryLazy',
  dependencies = { 'kevinhwang91/promise-async' },
  config = function()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = '[UFO]: Open all folds' })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = '[UFO]: Close all folds' })
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (' 󰁂 %d '):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, 'MoreMsg' })
      return newVirtText
    end
    require('ufo').setup {
      fold_virt_text_handler = handler,
      open_fold_hl_timeout = 400,
      close_fold_kinds_for_ft = {
        default = { 'imports', 'comment' },
      },
      enable_get_fold_virt_text = false,
      preview = {
        win_config = {
          border = { '', '?', '', '', '', '?', '', '' },
          winhighlight = 'Normal:Folded',
          winblend = 0,
        },
      },
    }
  end,
}
