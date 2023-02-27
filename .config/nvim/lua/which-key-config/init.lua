local wk = require('which-key')

local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end

local lsp_formatting = function()
  vim.lsp.buf.format { async = true }
end

local Telescope = {
  name = "Telescope",
  f = { ":Telescope find_files<CR>", "Find Files" },
  g = { ":Telescope live_grep<CR>", "Live Grep" },
  b = { ":Telescope buffers<CR>", "Find Buffers" },
  h = { ":Telescope help_tags<CR>", "Help Tags" },
  r = { ":Telescope oldfiles<CR>", "Recent Files" },
  d = { ":TodoTelescope<CR>", "Find To Do" }
}

local ToggleTerm = {
  name = "Terminal",
  t = { ":ToggleTerm<cr>", "Split Below" },
  b = { ":ToggleTerm direction=tab<cr>", "Open in New Tab" },
  f = { toggle_float, "Floating Terminal" }
}

local Packer = {
  name = "Packer",
  r = { ":PackerClean<cr>", "Remove Unused Plugins" },
  c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
  i = { ":PackerInstall<cr>", "Install Plugins" },
  p = { ":PackerProfile<cr>", "Packer Profile" },
  s = { ":PackerSync<cr>", "Sync Plugins" },
  S = { ":PackerStatus<cr>", "Packer Status" },
  u = { ":PackerUpdate<cr>", "Update Plugins" }
}

local LSP = {
  name = "LSP",
  i = { ":LspInfo<cr>", "Connected Language Servers" },
  x = { ":LspInstallInfo<cr>", "Connected Language Servers" },
  k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
  K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
  w = {
    '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder"
  },
  W = {
    '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>',
    "Remove Workspace Folder"
  },
  l = {
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
    "List Workspace Folders"
  },
  t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition" },
  d = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition" },
  D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration" },
  r = { '<cmd>lua vim.lsp.buf.references()<cr>', "References" },
  R = { '<cmd>Lspsaga rename<cr>', "Rename" },
  a = { '<cmd>Lspsaga code_action<cr>', "Code Action" },
  e = { '<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics" },
  n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic" },
  N = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic" },
  f = { lsp_formatting, "LSP Formatting" }
}

local ZenMode = {
  name = "Zen Mode",
  z = { ":ZenMode<cr>", "Zen Mode" },
  t = { ":Twilight<cr>", "Twilight" }
}

local Markdown = {
  name = "Markdown",
  f = { "<Plug>Markdown_Fold", "Fold" },
  h = { ":HeaderIncrease<CR>", "Increase Header" },
  H = { ":HeaderDecrease<CR>", "Decrease Header" },
  i = { ":InsertToc<CR>", "Insert Table of Content" },
  I = { ":InsertNToc<CR>", "Insert Numbered Table of Content" },
  t = { ":Toc<CR>", "Table of Content" },
  v = { ":MarkdownPreviewToggle<CR>", "Markdown Preview" }
}

local lineNum = vim.api.nvim__buf_stats(0).current_lnum

local warpParagraph = function()
  -- vim.api.nvim_command(':v/^$/norm vipgwj')
  -- vim.api.nvim_command(':noh')

  vim.api.nvim_command(':norm ggVGgw' .. lineNum .. 'gg')
end

local lines2Paragraph = function()
  vim.api.nvim_command(':v/^$/norm vipJ')
  vim.api.nvim_command(':noh')
  vim.api.nvim_command(':norm ' .. lineNum .. 'gg')
end

local clearDoubleQuoteOpen = function()
  vim.api.nvim_command(":%s/“/\"/g")
  vim.api.nvim_command(':noh')
  vim.api.nvim_command(':norm ' .. lineNum .. 'gg')
end

local clearDoubleQuoteClose = function()
  vim.api.nvim_command(":%s/”/\"/g")
  vim.api.nvim_command(':noh')
  vim.api.nvim_command(':norm ' .. lineNum .. 'gg')
end

local clearSingleQuote = function()
  vim.api.nvim_command(":%s/’/'/g")
  vim.api.nvim_command(':noh')
  vim.api.nvim_command(':norm ' .. lineNum .. 'gg')
end

local clearAllQuote = function()
  vim.api.nvim_command(":%s/“/\"/g | %s/”/\"/g | %s/’/'/g")
  vim.api.nvim_command(':noh')
  vim.api.nvim_command(':norm ' .. lineNum .. 'gg')
end

local clearQuote = {
  name = "Clear Quote",
  a = { clearDoubleQuoteOpen, "”" },
  i = { clearDoubleQuoteClose, "”" },
  s = { clearSingleQuote, "’" },
  x = { clearAllQuote, "All" }
}

local mappings = {
  e = { ":NvimTreeToggle<CR>", "Open or Close the tree" },
  b = { ":NvimTreeFocus<CR>", "Focus on the tree" },
  w = { ":w<CR>", "Save" },
  W = { ":wq<CR>", "Save and Quit" },
  q = { ":q<CR>", "Quit" },
  Q = { ":q!<CR>", "Force Quit" },
  x = { ":bd<CR>", "Close Buffer" },
  X = { ":bufdo bd<CR>", "Close All Buffers" },
  r = { ":luafile %<CR>", "Reload file" },
  f = Telescope,
  h = { "Move Window Left" },
  j = { "Move Window Down" },
  k = { "Move Window Up" },
  l = { "Move Window Right" },
  J = { lines2Paragraph, "Join All Paragraph" },
  K = { warpParagraph, "Wrap Paragraph" },
  t = ToggleTerm,
  T = clearQuote,
  o = { ':set paste<CR>m`o<Esc>``:set nopaste<CR>j', "Insert New Line Below" },
  O = { ':set paste<CR>m`O<Esc>``:set nopaste<CR>k', "Insert New Line Above" },
  p = Packer,
  L = LSP,
  z = ZenMode,
  m = Markdown
}

wk.register({ ['<leader>'] = mappings })
