# Qtile Workspaces

from libqtile.command import lazy
from libqtile.config import Group, Key

from .keys import keys, mod

layout_type = "MonadTall"

# groups = [
#     Group(" 一 ", layout=layout_type),
#     Group(" ニ ", layout=layout_type),
#     Group(" 三 ", layout=layout_type),
#     Group(" 四 ", layout=layout_type),
#     Group(" 五 ", layout=layout_type),
# ]
groups = [
    Group(" ウェブ ", layout=layout_type),
    Group(" デベ ", layout=layout_type),
    Group(" ドキュメント ", layout=layout_type),
    Group(" ミュージック ", layout=layout_type),
    Group(" ビデオ ", layout=layout_type),
    Group(" ギーム ", layout=layout_type),
    Group(" システム ", layout=layout_type),
]

# groups = [
#     Group("  ", layout=layout_type),
#     Group("  ", layout=layout_type),
#     Group("  ", layout=layout_type),
#     Group("  ", layout=layout_type),
#     Group("  ", layout=layout_type),
#     Group("  ", layout=layout_type),
# ]

for i, group in enumerate(groups):
    actual_key = str(i + 3)
    keys.extend(
        [
            # Switch to workspace N
            Key([mod], actual_key, lazy.group[group.name].toscreen()),
            Key(["control"], "F" + actual_key, lazy.group[group.name].toscreen()),
            # Send window to workspace N
            Key([mod, "shift"], actual_key, lazy.window.togroup(group.name)),
        ]
    )
