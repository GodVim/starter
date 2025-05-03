vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("config.lazy")




require("lazy").setup({
	spec = {
		-- GodVim Plugins -- remove whichever modulules you like
		{ "GodVim/GODVIM",                 branch = "main", import = "godvim.plugins" },
		{ import = "godvim.plugins.cp", },
		{ import = "godvim.plugins.ui" },
		{ import = "godvim.plugins.lsp" },
		{ import = "godvim.plugins.editor" },
		{ import = "godvim.plugins.lang" },
		-- Override GodVim's plugins
		{ import = "plugins" },
	},
}, lazy_config)

require "options"
require "autocmds"
require "keymaps"
