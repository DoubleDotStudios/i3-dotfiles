# Dotfiles

## Install

1. Install the dependencies:
- i3
- neovim
- kitty
- picom
- polybar
- dunst
- rofi
- fastfetch
- CaskaydiaCove Nerd Font / CascadiaCode

2. Clone the repo:
```console
git clone https://github.com/DoubleDotStudios/i3-dotfiles
cd ./i3-dotfiles
```

3. Move all the folders except `rofi/local` to `~/.config`:
```console
mv ./i3 ~/.config
mv ./nvim ~/.config
mv ./dunst ~/.config
mv ./kitty ~/.config
mv ./picom ~/.config
mv ./polybar ~/.config
mv ./fastfetch ~/.config
mv ./rofi/config ~/.config/rofi
```

4. Move `rofi/local` to `~/.local/share/rofi`:
```console
mv ./rofi/local ~/.local/share/rofi
```

---

### Credit (Configs I used and modified):
lactua: [Rofi and Dunst](https://github.com/lactua/dotfiles/tree/master/dots/rofi)
astonish-g: [Polybar](https://github.com/astonish-g/i3-everforest-dotfiles/tree/main/.config/polybar)
