local set = vim.opt

set.number = true
set.relativenumber = true

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true

set.wrap = true
set.textwidth = 80
set.linebreak = true
set.breakindent = true

set.scrolloff = 3
set.fileencoding = 'utf-8'
set.termguicolors = true

set.hidden = true

set.cursorline = true
set.colorcolumn = '81,121'
set.guicursor = 'i:hor50'

set.shell = 'fish'

vim.cmd([[
  hi Comment guifg=#00ff00
]])
