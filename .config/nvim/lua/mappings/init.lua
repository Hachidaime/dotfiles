local map = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }

function opts(description)
  return { noremap = true, silent = true, desc = description }
end

-- vim.g.mapleader = '\\'

map('n', '<TAB>', ':BufferLineCycleNext<CR>', opts())
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', opts())
map('n', 'gk', ':BufferLineMoveNext<CR>', opts('Buffer Line Move Next'))
map('n', 'gj', ':BufferLineMovePrev<CR>', opts('Buffer Line Move Previous'))

map('n', '<leader>h', '<C-w>h', opts())
map('n', '<leader>j', '<C-w>j', opts())
map('n', '<leader>k', '<C-w>k', opts())
map('n', '<leader>l', '<C-w>l', opts())

-- map('n', '<leader>C', ":! tr ' ' '\n' < '%' | sort | uniq -c | wc -l <CR>", opts())

function next_todo()
  require("todo-comments").jump_next()
end

function prev_todo()
  require("todo-comments").jump_prev()
end

map("n", "]t", ':lua next_todo()<CR>', opts('Next todo comment'))
map("n", "[t", ':lua prev_todo()<CR>', opts('Previous todo comment'))

map('n', 'gz', '<Plug>Markdown_Fold', opts('Markdown Fold'))

map('n', 'gcd', ':g/^\\s*<!--/d<CR>', opts('Delete All Commented Lines'))

map('i', 'jk', '<ESC>', opts())
map('i', 'kj', '<ESC>', opts())

map('i', '<Plug>', '<Plug>Markdown_CreateLink', opts('Markdown Create Link'))

map('v', '<C-j>', ":m '>+1<CR>gv=gv", opts())
map('v', '<C-k>', ":m '>-2<CR>gv=gv", opts())
