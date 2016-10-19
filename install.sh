#!/bin/sh

current_dir=$PWD

link_home() {
    src=$1
    dest=$2
    fulldest=${HOME}/${dest}
    dest_path=$(dirname "${fulldest}")
    mkdir -p "${dest_path}"
    if [ -d "${fulldest}" ]; then
        rm -v "${fulldest}"
    fi
    ln -svf "${current_dir}/${src}" "${fulldest}"
}

prev_ptr=current_dir_var

add_subdir() {
    # Caller
    next_current_dir=${current_dir}/$1

    next_prev_ptr="${prev_ptr}0"
    eval ${next_prev_ptr}='$prev_ptr'
    eval ${next_prev_ptr}_name='$current_dir'

    prev_ptr=$next_prev_ptr
    current_dir=$next_current_dir
    . "$current_dir/install.sh"
    eval current_dir='$'${prev_ptr}_name
    eval prev_ptr='$'${prev_ptr}
}

if [ "$#" -ne 0 ]; then
    for f in "$@"; do
        add_subdir "$f"
    done
else
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
fi
