#!/bin/sh

if [ "$islinux" = 1 ]; then
    if test -f gitconfig-$profile; then
        link_home gitconfig-$profile .gitconfig
    else
        link_home gitconfig .gitconfig
    fi
else
    if test -f gitconfig-$profile.win; then
        link_home gitconfig-$profile.win .gitconfig
    elif test -f gitconfig-$profile; then
        link_home gitconfig-$profile .gitconfig
    else
        link_home gitconfig .gitconfig
    fi
fi

if test -z "$XDG_CONFIG_HOME"; then
    link_home gitignore .config/git/ignore
else
    link_abs gitignore "${XDG_CONFIG_HOME}/git/ignore"
fi
