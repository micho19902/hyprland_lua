source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

abbr -a yyu yay -Syu --noconfirm
abbr -a y yay -Ssy
abbr -a yy yay --noconfirm
# abbr -a S sudo pacman -Ssy --noconfirm
# abbr -a Ss sudo pacman -Sy --noconfirm
# abbr -a Ssu sudo pacman -Syu --noconfirm
starship init fish | source
