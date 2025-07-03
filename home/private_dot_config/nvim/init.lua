-- https://learnxinyminutes.com/docs/lua/
--
-- :help lua-guide
-- (or HTML version): https://neovim.io/doc/user/lua-guide.html
--
--  MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
--  which is very useful when you're not exactly sure of what you're looking for.

-- Set <space> as the leader key:
-- See `:help mapleader`
--  WARNING: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- Import modules inside ./lua directory:
require 'options'
require 'keymaps'
require 'plugin-manager'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
