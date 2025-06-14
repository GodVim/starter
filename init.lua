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
    { "GodVim/GODVIM",                 import = "godvim.plugins" },
    { import = "godvim.plugins.ui" },

    { import = "godvim.plugins.lang" },
    { import = "godvim.plugins.editor" },
    -- Override GodVim's plugins
    { import = "plugins" },
  },
}, lazy_config)

require("options")
require("autocmds")
require("keymaps")
