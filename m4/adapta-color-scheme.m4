# ADAPTA_COLOR_SCHEME ()
# -----------------------------------------------------------
AC_DEFUN([ADAPTA_COLOR_SCHEME], [

    selection_default="`grep 'key-gruvbox-select' ./gtk/sass/common/_colors.scss | \
                        cut -d' ' -f3`"
    accent_default="`grep 'key-gruvbox-accent' ./gtk/sass/common/_colors.scss | \
                     cut -d' ' -f3`"
    suggestion_default="`grep 'key-gruvbox-suggest' ./gtk/sass/common/_colors.scss | \
                         cut -d' ' -f3`"
    destruction_default="`grep 'key-gruvbox-destroy' ./gtk/sass/common/_colors.scss | \
                          cut -d' ' -f3`"

    AC_ARG_WITH(
        [selection_color],
        [AS_HELP_STRING(
            [--with-selection_color],
            [Primary color for selected-items \
             (Default: #076678 (gruvbox-blue-d))]
        )],
        [SELECTION="$withval"],
        [SELECTION=$selection_default]
    )
    AC_SUBST([SELECTION])

    AC_ARG_WITH(
        [accent_color],
        [AS_HELP_STRING(
            [--with-accent_color],
            [Secondary color for notifications and OSDs \
             (Default: #689D6A (gruvbox-aqua-m))]
        )],
        [ACCENT="$withval"],
        [ACCENT=$accent_default]
    )
    AC_SUBST([ACCENT])

    AC_ARG_WITH(
        [suggestion_color],
        [AS_HELP_STRING(
            [--with-suggestion_color],
            [Secondary color for 'suggested' buttons \
             (Default: #427B58 (gruvbox-aqua-d))]
        )],
        [SUGGESTION="$withval"],
        [SUGGESTION=$suggestion_default]
    )
    AC_SUBST([SUGGESTION])

    AC_ARG_WITH(
        [destruction_color],
        [AS_HELP_STRING(
            [--with-destruction_color],
            [Tertiary color for 'destructive' buttons \
             (Default: #FB4934 (gruvbox-red-d))]
        )],
        [DESTRUCTION="$withval"],
        [DESTRUCTION=$destruction_default]
    )
    AC_SUBST([DESTRUCTION])

# Store defined key color-scheme into SCSS file
echo \
"// Selection (Primary) color
\$key_selection_color: `echo $SELECTION`;

// Accent (Seondary) color
\$key_accent_color: `echo $ACCENT`;

// Suggestion color
\$key_suggestion_color: `echo $SUGGESTION`;

// Destruction (Tertiary) color
\$key_destruction_color: `echo $DESTRUCTION`;" \
> ./gtk/sass/common/_key_colors.scss

# Copy SCSS to shell SASS directory
cp -R ./gtk/sass/common/_key_colors.scss \
       ./shell/sass/common/_key_colors.scss

AC_MSG_RESULT([creating sass/common/_key_colors.scss])

# Copy gruvbox pallete to SASS directories
cp -R ./defaults/colors/gruvbox_palette.scss \
         ./gtk/sass/common/_gruvbox_palette.scss

cp -R ./defaults/colors/gruvbox_palette.scss \
         ./shell/sass/common/_gruvbox_palette.scss

AC_MSG_RESULT([creating sass/common/_gruvbox_palette.scss])

])
