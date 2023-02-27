vim.lsp.handlers['textDocument/publishDiagnostics'] =
vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  virtual_text = { spacing = 5, severity_limit = 'Warning' },
  update_in_insert = true
})

require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "html", "javascript", "lua", "css", "php", "python", "markdown", "help"
  },
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  autotag = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = { "#FFD700", "#DA70D6", "#179fff" }, -- table of hex strings
    colors = { "#d75f00", "#8700af", "#005f87" } -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autopairs = { enable = true }
}
