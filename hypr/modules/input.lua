---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,es",
        kb_options = "grp:alt_shift_toggle",
        numlock_by_default = true,

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
