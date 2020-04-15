#!/bin/sh

# srcdir
# workdir

. "${srcdir}/lib/array.sh"

current_dir=$srcdir

link_home() {
    src=$1
    dest=$2
    fulldest=${HOME}/${dest}
    dest_path=$(dirname "${fulldest}")
    # mkdir -p "${dest_path}"
    # if [ -d "${fulldest}" ]; then
    #     rm -v "${fulldest}"
    # fi
    # ln -svf "${current_dir}/${src}" "${fulldest}"
    echo "${current_dir}/${src}" "->" "${fulldest}"
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
