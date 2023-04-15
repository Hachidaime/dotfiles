from libqtile import qtile, widget
from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration

from .theme import colors

terminal = "alacritty"


def base(fg="text", bg="dark"):
    return {
        "foreground": colors[fg],
        "background": colors[bg],
    }


def border(border="dark"):
    return {
        "decorations": [
            BorderDecoration(
                colour=colors[border],
                border_width=[0, 0, 2, 0],
                # padding=1,
            )
        ],
        "padding": 5,
    }


def separator():
    return widget.Sep(
        **base(),
        linewidth=0,
        padding=5,
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        font="JetBrainsMono Nerd Font Mono",
        text="",
        fontsize=32,
        padding=-2,
    )


def powerline2(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        font="JetBrainsMono Nerd Font Mono",
        text="",
        fontsize=32,
        padding=-2,
    )


def apps_launcher():
    return [
        separator(),
        widget.TextBox(
            "",
            **base(fg="light"),
            font="Iosevke Nerd Font",
            fontsize=12,
            padding=8,
            mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("launcher_t4")},
        ),
    ]


def workspaces():
    return [
        # widget.Spacer(
        #     **base(bg="dark"),
        # ),
        widget.GroupBox(
            **base(fg="color4"),
            font="JetBrainsMono Nerd Font Bold",
            fontsize=9,
            margin_y=3,
            margin_x=0,
            padding_y=5,
            padding_x=2,
            borderwidth=3,
            active=colors["active"],
            inactive=colors["inactive"],
            rounded=False,
            # highlight_method="block",
            highlight_color=colors["dark"],
            highlight_method="line",
            # urgent_alert_method="block",
            # urgent_border=colors["urgent"],
            this_current_screen_border=colors["color1"],
            this_screen_border=colors["dark"],
            other_current_screen_border=colors["dark"],
            other_screen_border=colors["dark"],
            disable_drag=True,
        ),
        separator(),
        widget.Prompt(
            **base(fg="light"),
        ),
        # widget.WindowName(
        #     **base(fg="focus"),
        #     format="{name}",
        #     # padding=5,
        # ),
        widget.Spacer(
            **base(bg="dark"),
        ),
        # separator(),
        # widget.Sep(),
    ]


def tray_icon():
    return [
        widget.CheckUpdates(
            **base(bg="dark"),
            colour_have_updates=colors["light"],
            colour_no_updates=colors["text"],
            update_interval=1800,
            distro="Fedora",
            display_format=" {updates}",
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(terminal + " -e sudo dnf update")
            },
            padding=5,
        ),
        separator(),
        widget.Cmus(
            **base(bg="dark"),
            fmt="",
        ),
        widget.Systray(
            **base(fg="light"),
            icon_size=16,
            padding=5,
        ),
        separator(),
        widget.CurrentLayoutIcon(
            scale=0.65,
            **base(fg="text"),
        ),
    ]


import calendar
import datetime
import locale


def today():
    locale.setlocale(locale.LC_ALL, "ja_JP")
    x = datetime.datetime.now()
    # return calendar.day_name[6]
    return x.strftime("%a")


DAY_TODAY = today()

primary_widgets = [
    # *apps_launcher(),
    # separator(),
    # separator(),
    *workspaces(),
    # widget.Clock(
    #     **base(fg="light"),
    #     fmt="{}",
    #     format="%I.%M %p",
    #     # **border(border="light"),
    # ),
    widget.Clock(
        **base(fg="light"),
        font="JetBrainsMono Nerd Font Bold",
        fmt="(%s) {}" % str(DAY_TODAY),
        format="%x %p%I時%M分",
        # format="%a, %d-%m-%Y %I.%M %p",
        # **border(border="color1"),
    ),
    widget.Spacer(
        **base(bg="dark"),
    ),
    # powerline("color4", "dark"),
    widget.CPU(
        **base(fg="light"),
        mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(terminal + " -e top")},
        fmt="{}",
        format="{load_percent}%",
        # **border(border="light"),
    ),
    separator(),
    *tray_icon(),
    separator(),
    widget.Memory(
        **base(fg="color4"),
        mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(terminal + " -e top")},
        # fmt="爛 {}",
        fmt="{}",
        **border(border="color4"),
    ),
    separator(),
    widget.Net(
        **base(fg="color3"),
        mouse_callbacks={
            "Button1": lambda: qtile.cmd_spawn(terminal + " -e nload wlp3s0")
        },
        interface="wlp3s0",
        # format=" {down} ↓↑ {up}",
        format="↓{down} ↑{up}",
        **border(border="color3"),
    ),
    separator(),
    widget.ThermalSensor(
        **base(fg="color2"),
        threshold=70,
        fmt=" {}",
        # fmt="{}",
        **border(border="color2"),
    ),
    separator(),
    widget.Volume(
        **base(fg="color1"),
        fmt=" {}",
        # fmt="{}",
        **border(border="color1"),
    ),
    # separator(),
    # separator(),
    separator(),
    # separator(),
    # widget.TextBox(
    #     "",
    #     **base(fg="light"),
    #     fontsize=10,
    #     padding=5,
    #     mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("powermenu_t1")},
    # ),
    # separator(),
]

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=9,
    padding=1,
)
extension_defaults = widget_defaults.copy()
