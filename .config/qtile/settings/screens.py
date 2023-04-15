import subprocess

from libqtile import bar
from libqtile.config import Screen
from libqtile.log_utils import logger

from .widgets import primary_widgets


def status_bar(widgets):
    return bar.Bar(widgets, 20, opacity=0.92)


screens = [
    Screen(
        wallpaper="~/Pictures/wallpapers/PLDW-HD-No-Logo.jpg",
        wallpaper_mode="fill",
        top=status_bar(primary_widgets),
    ),
]
