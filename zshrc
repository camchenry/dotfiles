# zshrc file
#
# Installation
# ------------
# Create a symbolic link at ~/.zshrc (or other path) by running:
# ```bash
# ln -s dotfiles/zshrc ~/.zshrc`
# ```
#
# Information
# -----------
# Loaded: when interactive
#
# What should go in this file:
#     - prompt
#     - command completion
#     - command suggestions
#     - command corrections
#     - command history
#     - output colors
#     - aliases
#     - key binds
#     - miscellaneous terminal tool
#

# Thanks to: https://superuser.com/a/39995
pathadd() {
    # Path will only be added if PATH does not already contain
    # it, and the directory actually exists
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

pathadd "/opt/homebrew/bin"
