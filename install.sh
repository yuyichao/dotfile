#!/bin/sh

script="$0"
workdir="$PWD"
# Get absolute directory from script
cd "$(dirname "$script")"
srcdir="$PWD"
cd "$workdir"

. "$srcdir/lib/functions.sh"

initialize "$@"

add_subdir git
add_subdir emacs
add_subdir ipython
add_subdir zsh
add_subdir bash
add_subdir fbterm
add_subdir mutt
add_subdir tmux
add_subdir hg
add_subdir dm
add_subdir xprofile
add_subdir matplotlib
add_subdir xfce_terminal
add_subdir konsole
add_subdir fontconfig
add_subdir nacs-lab
add_subdir jupyter

finalize
