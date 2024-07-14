return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "ss",    mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "[F]lash" },
    { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "[F]lash Treesitter" },
    { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  },
}
-- vim: ts=2 sts=2 sw=2 et
