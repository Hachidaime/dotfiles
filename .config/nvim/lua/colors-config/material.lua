require('material').setup({
  contrast = {
    sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    line_numbers = true, -- Enable contrast background for line numbers
    sign_column = true, -- Enable contrast background for the sign column
    cursor_line = true, -- Enable darker background for the cursor line
    non_current_windows = true -- Enable darker background for non-current windows
  },
  -- italics = {
  --   comments = true, -- Enable italic comments
  --   keywords = true, -- Enable italic keywords
  --   functions = true, -- Enable italic functions
  -- },
  styles = { -- Give comments style such as bold, italic, underline etc.
    comments = {italic = true},
    functions = {bold = true, italic = true},
    keywords = {italic = true}
  },
  plugins = { -- Uncomment the plugins that you use to highlight them
    -- Available plugins:
    -- "dap",
    "dashboard", "gitsigns", -- "hop",
    -- "indent-blankline",
    "lspsaga", -- "mini",
    -- "neogit",
    "nvim-cmp", -- "nvim-navic",
    "nvim-tree", -- "sneak",
    "telescope", -- "trouble",
    "which-key"
  },
  custom_colors = function(colors)
    colors.syntax.comments = "#00FF00"
  end
})

vim.g.material_style = "deep ocean"
-- vim.g.material_style = "lighter"
vim.cmd 'colorscheme material'
