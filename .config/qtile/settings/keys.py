# Qtile Keybindings

from libqtile.command import lazy
from libqtile.config import Key

from .widgets import terminal

mod = "mod4"

keys = [
    Key(key[0], key[1], *key[2:])
    for key in [
        # A list of available commands that can be bound to keys can be found
        # at https://docs.qtile.org/en/latest/manual/config/lazy.html
        # Switch between windows
        # h = left, l = right, j = down, k = up
        ([mod], "h", lazy.layout.left()),
        ([mod], "l", lazy.layout.right()),
        ([mod], "j", lazy.layout.down()),
        ([mod], "k", lazy.layout.up()),
        # Move window focus to other window
        ([mod], "f", lazy.layout.next()),
        # Move windows between left/right columns or move up/down in current stack.
        # Moving out of range in Columns layout will create new column.
        # h = left, l = right, j = down, k = up
        ([mod, "shift"], "h", lazy.layout.shuffle_left()),
        ([mod, "shift"], "l", lazy.layout.shuffle_right()),
        ([mod, "shift"], "j", lazy.layout.shuffle_down()),
        ([mod, "shift"], "k", lazy.layout.shuffle_up()),
        # Grow windows. If current window is on the edge of screen and direction
        # will be to screen edge - window would shrink.
        # h = left, l = right, j = down, k = up
        ([mod, "control"], "h", lazy.layout.grow_left()),
        ([mod, "control"], "l", lazy.layout.grow_right()),
        ([mod, "control"], "j", lazy.layout.grow_down()),
        ([mod, "control"], "k", lazy.layout.grow_up()),
        # Reset all window sizes
        ([mod], "n", lazy.layout.normalize()),
        # Toggle between split and unsplit sides of stack.
        # Split = all windows displayed
        # Unsplit = 1 window displayed, like Max layout, but still with
        # multiple stack panes
        ([mod, "shift"], "Return", lazy.layout.toggle_split()),
        # Launch terminal
        ([mod], "Return", lazy.spawn(terminal)),
        # Toggle between different layouts as defined below
        ([mod], "Tab", lazy.next_layout()),
        # Kill focused window
        ([mod], "w", lazy.window.kill()),
        # Reload the config
        ([mod, "control"], "r", lazy.reload_config()),
        # Shutdown Qtile
        ([mod, "control"], "q", lazy.shutdown()),
        # Spawn a command using a prompt widget
        ([mod], "r", lazy.spawncmd()),
        # Apps launcher
        ([mod], "space", lazy.spawn("launcher_t4")),
        # Apps switcher
        ([mod], "p", lazy.spawn("launcher_t4_window")),
        # Cheatsheet launcher
        ([mod], "c", lazy.spawn("keybinding_launcher")),
        # Powermenu launcher
        ([mod], "x", lazy.spawn("powermenu_t1")),
        # Volume control
        ([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
        ([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 1 sset Master 1- unmute")),
        ([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 1 sset Master 1+ unmute")),
        # Print screen
        ([], "Print", lazy.spawn("xfce4-screenshooter")),
    ]
]
