# i3-Dotfiles

> [!IMPORTANT]
> There may be errors in the [**dependencies**](#dependencies) and [**install**](#install) sections.  
> If you find any please report them in `issues`.  

---

[Preview](#preview)  
[Dependencies](#dependencies)  
[Extras](#optional-extras)  
[Install](#install)  
[Credit](#credit)  

---

## Preview

![Empty](<./assets/Blank Workspace.png>)
*Blank Workspace*  


![Empty](<./assets/Two Windows Open.png>)
*SolarVim and Zen*  


![Empty](<./assets/System Fetch.png>)
*Fastfetch*  


![Empty](<./assets/Rofi Launcher.png>)
*Rofi launcher*  


![Empty](<./assets/Rofi Powermenu.png>)
*Rofi power menu*  


---

## Dependencies
- i3

- rofi
- picom
- polybar
- dunst

- neovim
- kitty

- CaskaydiaCove Nerd Font / CascadiaCode
- Tela Circle Dracula Icons

---

## Optional Extras
> lacking some require modification of the i3 config file, indicated by *


- \* thunar
- \* zen-browser
- \* light **not** lightdm
- \* flameshot
- \* nitrogen
- \* discord

- fastfetch
- yazi

---

## Install

1. Clone the repo:
```console
git clone https://github.com/DoubleDotStudios/i3-dotfiles
cd ./i3-dotfiles
```

2. Move all directories except `rofi/local` to `~/.config`:
```console
mv ./i3 ~/.config
mv ./nvim ~/.config
mv ./dunst ~/.config
mv ./kitty ~/.config
mv ./picom ~/.config
mv ./polybar ~/.config
mv ./fastfetch ~/.config
mv ./rofi/config ~/.config/rofi
mv ./yazi ~/.config/yazi
```

3. Move `rofi/local` to `~/.local/share/rofi`:
```console
mv ./rofi/local ~/.local/share/rofi
```

---

### Credit

lactua: [Rofi and Dunst](https://github.com/lactua/dotfiles/tree/master/dots)  
astonish-g: [Polybar](https://github.com/astonish-g/i3-everforest-dotfiles/tree/main/.config/polybar)
