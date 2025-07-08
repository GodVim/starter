if vim.env.PROF then
  -- example for lazy.nvim
  -- change this to the correct path for your plugin manager
  local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"
  vim.opt.rtp:append(snacks)
  require("snacks.profiler").startup({
    startup = {
      -- event = "VimEnter", -- stop profiler on this event. Defaults to `VimEnter`
      -- event = "UIEnter",
      event = "VeryLazy",
    },
  })
end

vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("config.lazy")

require("lazy").setup({
  spec = {
    -- GodVim Plugins -- remove whichever modules you like
    { "GodVim/GODVIM", dev = true,                import = "godvim.plugins" },
    -- Override GodVim's plugins
    { import = "plugins" },
  },
}, lazy_config)

require("options")
require("autocmds")
require("keymaps")
