#!/bin/sh

# srcdir
# workdir

. "${srcdir}/lib/array.sh"

profile_file=${workdir}/profile
srclist_file=${workdir}/srclist
dstlist_file=${workdir}/dstlist
filter_file=${workdir}/filter

array_def old_srclist
array_def old_dstlist
array_def old_filter

action=''

needs_subdir=1

print_help() {
    cat <<EOF
Usage $0 [-h|--help|-<profile_name>|<action> <options...>]

  -h|--help:
    Print this message and exit.

  -<profile_name>
    Perform install action with specified profile name.

Actions:

* install [options] [filters]

  Install the dotfiles in the specified profile.

  Options:

    -p profile_name
    -a do not follow the previously saved filter.
       If additional fillters are specified, the new filters will be used instead

  Filters: all arguments following the options are treated as filters
    only top level directories in the list will be installed.
    This will be added to existing filters if any.

* diff

  Compare installed file and the one in the repo.

* copy_back

  Copy the installed files back to the repo.

EOF
}

process_args() {
    # Short form of specifying a profile
    if test $# -eq 1; then
        case "$1" in
            --help)
                print_help
                exit 1
                ;;
            -h)
                print_help
                exit 1
                ;;
            -*)
                profile=${1#-}
                shift
                ;;
        esac
    fi
    if test $# -eq 0; then
        action=install
    else
        action=$1
        shift
    fi
    case "$action" in
        install)
            while getopts p:a name; do
                case $name in
                    p)
                        profile="$OPTARG"
                        ;;
                    a)
                        array_clear filter
                        ;;
                    ?)
                        print_help
                        exit 1
                        ;;
                esac
            done
            shift $(($OPTIND - 1))
            array_push filter "$@"
            ;;
        diff)
            if test $# -ne 0; then
                echo "Unnknown option for diff: $*" >&2
                exit 1
            fi
            needs_subdir=0
            ;;
        copy_back)
            if test $# -ne 0; then
                echo "Unnknown option for copy_back: $*" >&2
                exit 1
            fi
            needs_subdir=0
            ;;
        *)
            echo "Unknown action: '$action'" >&2
            print_help
            exit 1
            ;;
    esac
    return
}

initialize() {
    if test -f "$profile_file"; then
        profile=$(cat "$profile_file")
    else
        profile=default
    fi
    old_profile="$profile"
    if test -f "$srclist_file"; then
        . "$srclist_file"
        array_append old_srclist srclist
        array_clear srclist
    else
        array_def srclist
    fi
    if test -f "$dstlist_file"; then
        . "$dstlist_file"
        array_append old_dstlist dstlist
        array_clear dstlist
    else
        array_def dstlist
    fi
    if test -f "$filter_file"; then
        . "$filter_file"
        array_append old_filter filter
    else
        array_def filter
    fi
    process_args "$@"
}

save_state() {
    if test "$profile" != "$old_profile" || (! test -f "$profile_file"); then
        printf "%s\n" "$profile" > "$profile_file"
    fi
    if ((! array_equal old_srclist srclist) && ! array_empty srclist) || \
           (! test -f "$srclist_file"); then
        array_dump srclist > "$srclist_file"
    fi
    if ((! array_equal old_dstlist dstlist) && ! array_empty dstlist) || \
           (! test -f "$dstlist_file"); then
        array_dump dstlist > "$dstlist_file"
    fi
    if (! array_equal old_filter filter) || (! test -f "$filter_file"); then
        array_dump filter > "$filter_file"
    fi
}

_remove_old_dst() {
    # $1 index
    # $2 value
    if ! array_contains dstlist "$2"; then
        rm -v "$2"
    fi
}

_install_src() {
    # $1 index
    # $2 value
    src="$2"
    array_get dstlist $1 dst
    dst_path=$(dirname "${dst}")
    mkdir -p "${dst_path}"
    if test -L "$dst" || test -f "$dst"; then
        rm -v "$dst"
    elif test -d "$dst"; then
        rm -rfv "$dst"
    fi
    if test -d "$src"; then
        cp -rv "$src" "$dst"
    else
        cp -v "$src" "$dst"
    fi
}

do_install() {
    if ! array_equal old_dstlist dstlist; then
        array_foreach old_dstlist _remove_old_dst
    fi
    array_foreach srclist _install_src
}

_diff_cmd=''

_diff_cb() {
    # $1 index
    # $2 value
    src="$2"
    array_get old_dstlist $1 dst
    $_diff_cmd -u "$src" "$dst"
}

do_diff() {
    if command -v colordiff >/dev/null 2>&1; then
        _diff_cmd=colordiff
    else
        _diff_cmd=diff
    fi
    _pager_cmd=''
    if command -v less >/dev/null 2>&1; then
        _pager_cmd='less -R'
    elif command -v more >/dev/null 2>&1; then
        _pager_cmd='more'
    fi
    if test -z "$_pager_cmd"; then
        array_foreach old_srclist _diff_cb
    else
        array_foreach old_srclist _diff_cb | $_pager_cmd
    fi
}

_copy_back_cb() {
    # $1 index
    # $2 value
    src="$2"
    array_get old_dstlist $1 dst
    if test -d "$dst"; then
        rm -rfv "$src"
        cp -rv "$dst" "$src"
    else
        cp -v "$dst" "$src"
    fi
}

do_copy_back() {
    array_foreach old_srclist _copy_back_cb
}

finalize() {
    if test $action = install; then
        do_install
        save_state
    elif test $action = diff; then
        do_diff
    elif test $action = copy_back; then
        do_copy_back
    fi
}

current_dir=$srcdir

array_def dir_stack

link_home() {
    link_abs "$1" "${HOME}/$2"
}

link_abs() {
    src=$1
    fulldst=$2
    dst_path=$(dirname "${fulldst}")
    array_push srclist "${current_dir}/${src}"
    array_push dstlist "${fulldst}"
}

add_subdir() {
    if array_empty dir_stack; then
        if (! array_empty filter) && (! array_contains filter "$1"); then
            echo "Skipped $1."
            return
        else
            echo "Adding $1."
        fi
    fi
    array_push dir_stack "${current_dir}"
    current_dir=${current_dir}/$1
    cd "$current_dir"
    . "$current_dir/install.sh"
    array_pop dir_stack current_dir
    cd "$current_dir"
}
