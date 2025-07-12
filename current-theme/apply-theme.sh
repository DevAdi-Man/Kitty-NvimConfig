#!/bin/bash

# Apply Current Theme Configuration Script
echo "Applying current theme configuration..."

# Set GTK theme
echo "Setting GTK theme..."
gsettings set org.gnome.desktop.interface gtk-theme 'Gruvbox-Yellow-Dark-Medium'

# Set icon theme
echo "Setting icon theme..."
gsettings set org.gnome.desktop.interface icon-theme 'Gruvbox-Plus-Dark'

# Copy and set wallpaper
echo "Setting wallpaper..."
cp "$(dirname "$0")/wallpaper.jpg" ~/.config/background
gsettings set org.gnome.desktop.background picture-uri "file://$HOME/.config/background"

# Apply terminal profile (requires manual import)
echo "Terminal profile configuration is available in theme-info.md"
echo "You may need to manually import terminal settings."

echo "Theme applied successfully!"
echo "Note: You may need to restart applications to see all changes."
