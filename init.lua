vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"

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
    { "GodVim/GODVIM", import = "godvim.plugins" },

    -- Extras exist!
    { import = "godvim.plugins.extras.misc.wakatime"},
    
    -- Override GodVim's plugins
    { import = "plugins" },
  },
}, lazy_config)

require("config.options")
require("config.autocmds")
require("config.keymaps")
