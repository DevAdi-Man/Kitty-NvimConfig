# Current System Theme Configuration

## GTK Theme
- **Theme Name**: Gruvbox-Yellow-Dark-Medium
- **Icon Theme**: Gruvbox-Plus-Dark

## Terminal Configuration
- **Font**: MesloLGS NF Italic 12
- **Background**: rgb(255,255,221) - Light cream
- **Foreground**: rgb(0,0,0) - Black
- **Cursor**: rgb(7,95,167) - Blue background, rgb(16,184,151) - Teal foreground

## Color Palette
- **Black**: rgb(23,20,33)
- **Red**: rgb(192,28,40)
- **Green**: rgb(38,162,105)
- **Yellow**: rgb(162,115,76)
- **Blue**: rgb(18,72,139)
- **Magenta**: rgb(163,71,186)
- **Cyan**: rgb(42,161,179)
- **White**: rgb(208,207,204)

## Bright Colors
- **Bright Black**: rgb(94,92,100)
- **Bright Red**: rgb(246,97,81)
- **Bright Green**: rgb(51,209,122)
- **Bright Yellow**: rgb(233,173,12)
- **Bright Blue**: rgb(42,123,222)
- **Bright Magenta**: rgb(192,97,203)
- **Bright Cyan**: rgb(51,199,222)
- **Bright White**: rgb(255,255,255)

## Wallpaper
- **Location**: ~/.config/background

## Installation Commands
```bash
# Set GTK theme
gsettings set org.gnome.desktop.interface gtk-theme 'Gruvbox-Yellow-Dark-Medium'

# Set icon theme  
gsettings set org.gnome.desktop.interface icon-theme 'Gruvbox-Plus-Dark'

# Set wallpaper
gsettings set org.gnome.desktop.background picture-uri 'file:///home/devs-itish/.config/background'
```
