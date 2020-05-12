#!/bin/sh

script="$0"
workdir="$PWD"
# Get absolute directory from script
cd "$(dirname "$script")"
srcdir="$PWD"
cd "$workdir"

# If we started in `$srcdir`, use a default workdir of `$srcdir/build`.
# This make sure (reasonably so) that we don't accidentally run without a build directory
# and allow simply running `./install.sh` by default.
if [ "$PWD" = "$srcdir" ]; then
    workdir="$srcdir/build"
    mkdir -p "$workdir"
    cd "$workdir"
fi

. "$srcdir/lib/functions.sh"

initialize "$@"

if ((needs_subdir)); then
    case "$(uname)" in
        [Ll]inux*)
            islinux=1
            ;;
        *)
            islinux=0
            ;;
    esac

    add_subdir git
    add_subdir emacs
    add_subdir zsh
    add_subdir bash
    if ((islinux)); then
        add_subdir ipython
        add_subdir tmux
        add_subdir jupyter
        if test "$profile" = home; then
            add_subdir fbterm
            add_subdir mutt
            add_subdir hg
            add_subdir dm
            add_subdir xprofile
            add_subdir matplotlib
            add_subdir xfce_terminal
            add_subdir konsole
            add_subdir fontconfig
            add_subdir nacs-lab
        fi
    fi
fi

finalize
