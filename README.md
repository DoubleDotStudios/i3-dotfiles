# Dotfiles

## Install

1. Clone the repo:
```console
git clone [insert link here]
```

2. Install the dependencies:
- i3
- neovim
- kitty
- picom
- polybar
- dunst
- rofi
- CaskaydiaCove Nerd Font / CascadiaCode

3. Move all the folders except `rofi/local` to `~/.config`:
```console
mv ./i3 ~/.config
mv ./nvim ~/.config
mv ./dunst ~/.config
mv ./kitty ~/.config
mv ./picom ~/.config
mv ./polybar ~/.config
mv ./rofi/config ~/.config/rofi
```

4. Move `rofi/local` to `~/.local/share/rofi`:
```console
mv ./rofi/local ~/.local/share/rofi
```
