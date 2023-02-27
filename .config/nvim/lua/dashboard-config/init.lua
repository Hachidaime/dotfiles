local db = require('dashboard')
db.custom_header = {
  '            ████████                                  ',
  '        ████        ████                              ',
  '      ██    ████████    ██            ████████        ',
  '    ██  ████        ████  ██        ██        ██      ',
  '    ██  ██    ████    ██  ██      ██    ████    ██    ',
  '  ██  ██    ██    ██    ██  ██████    ██    ██    ██  ',
  '  ██  ██  ██        ██  ██          ██        ██  ██  ',
  '  ██  ██  ██        ██  ██          ██        ██  ██  ',
  '  ██  ██    ██    ██    ██  ██████    ██    ██    ██  ',
  '    ██  ██    ████    ██  ██      ██    ████    ██    ',
  '    ██  ████        ████  ██        ██        ██      ',
  '      ██    ████████    ██            ████████        ',
  '        ████        ████                              ',
  '            ████████                                  '
}
db.custom_center = {
  {
    icon = ' ',
    desc = 'Find Files             ',
    action = 'Telescope find_files',
    shortcut = '\\ f f'
  }, {
    icon = ' ',
    desc = 'Search Text            ',
    action = 'Telescope live_grep',
    shortcut = '\\ f g'
  }, {
    icon = ' ',
    desc = 'Recent Files           ',
    action = 'Telescope oldfiles',
    shortcut = '\\ f r'
  }, {
    icon = ' ',
    desc = 'Find Todo              ',
    action = 'TodoTelescope',
    shortcut = '\\ f d'
  }, {
    icon = ' ',
    desc = 'Quit                   ',
    action = 'q',
    shortcut = '\\ q  '
  }
}
db.custom_footer = {
  "There are two ways to be fooled.",
  "One is to believe what isn't true; the other is to refuse to believe what is true.",
  "~ Søren Kierkegaard"
}
db.header_pad = 3
db.center_pad = 3
db.footer_pad = 3
db.hide_statusline = true
