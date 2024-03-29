import subprocess
from os import path

from libqtile import hook, qtile
from libqtile.config import Match

from settings.groups import groups
from settings.keys import keys, mod
from settings.layouts import floating_layout, layouts
from settings.mouse import mouse
from settings.path import qtile_path
from settings.screens import screens
from settings.widgets import extension_defaults, widget_defaults

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "urgent"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None


@hook.subscribe.startup_once
def autostart():
    subprocess.call([path.join(qtile_path, "autostart.sh")])


@hook.subscribe.client_new
def disable_floating(window):
    rules = [Match(wm_class="mpv")]

    if any(window.match(rule) for rule in rules):
        window.togroup(qtile.current_group.name)
        window.cmd_disable_floating()


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
