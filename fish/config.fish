source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

abbr -a Yy yay -Sy
abbr -a y yay -Ssy
abbr -a S sudo pacman -Ssy
abbr -a Ss sudo pacman -Sy
starship init fish | source
