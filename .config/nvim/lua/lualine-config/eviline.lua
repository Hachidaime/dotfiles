-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

require('lualine-config.eviline-tokyonight')

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 120
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.terminal_black } },
      inactive = { c = { fg = colors.fg, bg = colors.terminal_black } }
    }
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {}
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {}
  }
}

local mode_color = {
  n = colors.cyan,
  i = colors.red,
  v = colors.purple,
  [''] = colors.green,
  V = colors.magenta,
  c = colors.blue,
  no = colors.cyan,
  s = colors.blue,
  S = colors.blue,
  [''] = colors.blue,
  ic = colors.yellow,
  R = colors.orange,
  Rv = colors.orange,
  cv = colors.blue,
  ce = colors.blue,
  r = colors.orange,
  rm = colors.blue,
  ['r?'] = colors.orange,
  ['!'] = colors.blue,
  t = colors.green
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  'mode',
  color = function()
    -- auto change color according to neovims mode
    return {
      fg = colors.terminal_black,
      bg = mode_color[vim.fn.mode()],
      gui = 'bold'
    }
  end
}

ins_left {
  -- mode component
  function()
    return ' '
  end,
  color = function()
    -- auto change color according to neovims mode
    return { fg = mode_color[vim.fn.mode()], gui = 'bold' }
  end,
  padding = { right = 1 }
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty
}

ins_left { 'filetype', icon_only = true }

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = 'bold' },
  path = 0,
  file_status = true,
  symbols = {
    modified = '', -- Text to show when the file is modified.
    readonly = '', -- Text to show when the file is non-modifiable or readonly.
    unnamed = '', -- Text to show for unnamed buffers.
    newfile = '' -- Text to show for new created file before first writting
  }
}

ins_left { 'location', color = { fg = colors.fg_dark, gui = 'bold' } }

ins_left { 'progress', color = { fg = colors.blue1, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    error = { fg = colors.red },
    warn = { fg = colors.yellow },
    info = { fg = colors.cyan }
  }
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  cond = conditions.hide_in_width,
  function()
    return '%='
  end
}

ins_left {
  -- Lsp server name .
  cond = conditions.hide_in_width,
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = colors.fg, gui = 'bold' }
}

-- Add components to right sections
ins_right {
  function()
    -- return "WDS: " .. vim.fn.wordcount().words
    if vim.bo.filetype == "md" or vim.bo.filetype == "txt" or vim.bo.filetype
        == "markdown" then
      if vim.fn.wordcount().visual_words == 1 then
        return "WDS: " .. tostring(vim.fn.wordcount().visual_words)
      elseif not (vim.fn.wordcount().visual_words == nil) then
        return "WDS: " .. tostring(vim.fn.wordcount().visual_words)
      else
        return "WDS: " .. tostring(vim.fn.wordcount().cursor_words) .. "/"
            .. tostring(vim.fn.wordcount().words)
      end
    else
      return ""
    end
  end,
  color = { fg = colors.cyan }
}

ins_right { 'branch', icon = '', color = { fg = colors.green, gui = 'bold' } }

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.git.add },
    modified = { fg = colors.git.change },
    removed = { fg = colors.git.delete }
  },
  cond = conditions.hide_in_width
}

ins_right {
  'fileformat',
  icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.yellow, gui = 'bold' }
}

ins_right {
  'fileformat',
  cond = conditions.hide_in_width,
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.yellow, gui = 'bold' }
}

ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = function()
    -- auto change color according to neovims mode
    return {
      fg = colors.terminal_black,
      bg = mode_color[vim.fn.mode()],
      gui = 'bold'
    }
  end
}

-- Now don't forget to initialize lualine
lualine.setup(config)
