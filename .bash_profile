if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx -- -nocursor >/dev/null 2>&1
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi