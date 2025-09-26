# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

# define timeout for multipurpose_modmap
define_timeout(1)

# [Global modemap] Change modifier keys as in xmodmap
define_modmap({Key.CAPSLOCK: Key.LEFT_CTRL})

# [Conditional modmap] Change modifier keys in certain applications
define_conditional_modmap(
    re.compile(r"Emacs"),
    {
        Key.RIGHT_CTRL: Key.ESC,
    },
)

# [Multipurpose modmap] Give a key two meanings. A normal key when pressed and
# released, and a modifier key when held down with another key. See Xcape,
# Carabiner and caps2esc for ideas and concept.
define_multipurpose_modmap(
    # Enter is enter when pressed and released. Control when held down.
    {Key.ENTER: [Key.ENTER, Key.RIGHT_CTRL]}
    # Capslock is escape when pressed and released. Control when held down.
    # {Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL]
    # To use this example, you can't remap capslock with define_modmap.
)

# [Conditional multipurpose modmap] Multipurpose modmap in certain conditions,
# such as for a particular device.
define_conditional_multipurpose_modmap(
    lambda wm_class, device_name: device_name.startswith("Microsoft"),
    {
        # Left shift is open paren when pressed and released.
        # Left shift when held down.
        Key.LEFT_SHIFT: [Key.KPLEFTPAREN, Key.LEFT_SHIFT],
        # Right shift is close paren when pressed and released.
        # Right shift when held down.
        Key.RIGHT_SHIFT: [Key.KPRIGHTPAREN, Key.RIGHT_SHIFT],
    },
)

# Keybindings for Firefox/Chrome
define_keymap(
    re.compile("Firefox|Google-chrome"),
    {
        # Ctrl+Alt+j/k to switch next/previous tab
        K("C-M-j"): K("C-TAB"),
        K("C-M-k"): K("C-Shift-TAB"),
        # Type C-j to focus to the content
        K("C-j"): K("C-f6"),
        # very naive "Edit in editor" feature (just an example)
        K("C-o"): [K("C-a"), K("C-c"), launch(["gedit"]), sleep(0.5), K("C-v")],
    },
    "Firefox and Chrome",
)


define_keymap(
    lambda wm_class: wm_class not in ("Emacs", "URxvt"),
    {
        # Alt+s for save
        K("M-s"): K("C-s"),
        # Alt+f for find/search
        K("M-f"): K("C-f"),
        # Alt+a for select all
        K("M-a"): K("C-a"),
        # Alt+t for new tab
        K("M-t"): K("C-t"),
        # Alt+n for new window
        K("M-n"): K("C-n"),
        # Alt+w for close window
        K("M-w"): K("C-w"),
        # Alt+q for close application
        K("M-q"): K("C-q"),
        # Alt-r for reload
        K("M-r"): K("C-r"),
        # Alt+z for undo
        K("M-z"): K("C-z"),
        # Alt+Shift+z for redo
        K("M-Shift-z"): K("C-Shift-z"),
        K("M-b"): K("C-b"),
    },
    "Alt shortcuts",
)


# Keybindings for Zeal https://github.com/zealdocs/zeal/
# define_keymap(
#     re.compile("Zeal"),
#     {
#         # Ctrl+s to focus search area
#         K("C-s"): K("C-k"),
#     },
#     "Zeal",
# )

# Emacs-like keybindings in non-Emacs applications
define_keymap(
    lambda wm_class: wm_class not in ("Emacs", "URxvt"),
    {
        # Cursor
        K("C-b"): with_mark(K("left")),
        K("C-f"): with_mark(K("right")),
        K("C-p"): with_mark(K("up")),
        K("C-n"): with_mark(K("down")),
        K("C-h"): with_mark(K("backspace")),
        K("C-a"): with_mark(K("home")),
        K("C-e"): with_mark(K("end")),
        # Delete
        K("C-d"): [K("delete"), set_mark(False)],
        # Kill line
        K("C-k"): [K("Shift-end"), K("C-x"), set_mark(False)],
    },
    "Emacs-like keys",
)
