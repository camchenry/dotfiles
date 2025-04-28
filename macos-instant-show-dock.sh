# Allows the macOS dock to show instantly when hidden by default.
# Thanks to https://github.com/gaurav-ketkar for showing me this trick.

defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
