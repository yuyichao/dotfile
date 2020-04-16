#!/bin/sh

# srcdir
# workdir

. "${srcdir}/lib/array.sh"

current_dir=$srcdir

array_def dir_stack

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

add_subdir() {
    array_push dir_stack "${current_dir}"
    current_dir=${current_dir}/$1
    . "$current_dir/install.sh"
    array_pop dir_stack current_dir
}
