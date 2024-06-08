if status is-interactive
    # Commands to run in interactive sessions can go here
    set -Ux MENU_OPTS "-l 10 --fn 'Inconsolata Nerd Font Mono 10' --counter always -n -i --nb '#000000' --ab '#000000'"

    set -l MENU_RUN bemenu-run -p 'RUN' $MENU_OPTS

    alias dotfiles='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
    alias menu_run="$MENU_RUN"

    # tmux
end
