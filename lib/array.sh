#!/bin/sh

# Array that only require posix-shell.
# Only variables used are:
# ${name}__array_len: length
# ${name}__array_${idx}: element, 1-base
# No other local variables are used.

_array_set_len() {
    # $1 name
    # $2 length
    eval "${1}__array_len=$2"
}

_array_set() {
    # $1 name
    # $2 index
    # $3 value
    eval "${1}__array_${2}=\$3"
}

_array_get() {
    # $1 name
    # $2 index
    # $3 variable
    eval "$3=\${${1}__array_${2}}"
}

_array_length_lt() {
    # $1 name
    # $2 length
    eval test $2 -gt "\${${1}__array_len}"
}

array_def() {
    # $1 name
    _array_set_len $1 0
}

array_push() {
    # $1 name
    # $2 new value
    eval set -- $1 '"$2"' "\${${1}__array_len}"
    _array_set $1 "$(($3 + 1))" "$2"
    _array_set_len $1 "$(($3 + 1))"
}

array_pop() {
    # $1 name
    # $2 var
    eval set -- $1 $2 "\${${1}__array_len}"
    _array_get $1 $3 $2
    _array_set_len $1 "$(($3 - 1))"
}

array_min_len() {
    # $1 name
    # $2 length
    while _array_length_lt $1 $2; do
        array_push $1 ''
    done
}

array_resize() {
    # $1 name
    # $2 length
    if _array_length_lt $1 $2; then
        array_min_len $1 $2
    else
        _array_set_len $1 $2
    fi
}

array_set() {
    # $1 name
    # $2 index
    # $3 value
    array_min_len $1 $2
    _array_set $1 $2 "$3"
}

array_get() {
    # $1 name
    # $2 index
    # $3 variable
    if _array_length_lt $1 $2; then
        eval "$3=''"
    else
        _array_get $1 $2 $3
    fi
}

_array_make_rest_cmd_list() {
    # $1 start
    # $2 end (include)
    while test $1 -le $2; do
        printf '"$%d" ' $1
        set -- $(($1 + 1)) $2
    done
}

# Callback is called with
# $1: index
# $2: value
# $3: total length
# $4: array name
# ${@:5}: rest of the parameters passed to `array_foreach`
array_foreach() {
    # $1 name
    # $2 function
    # ${@:3} rest of arguments to pass to the callback
    set -- 1 "$(_array_make_rest_cmd_list 5 $(($# + 2)))" "$@"
    # $1 loop index
    # $2 string evals to rest of the arguments
    # $3 name
    # $4 function
    # ${@:5} rest of arguments to pass to the callback
    while ! _array_length_lt $3 $1; do
        eval '$4' $1 "\"\${${3}__array_${1}}\"" "\${${3}__array_len}" $3 "$2"
        eval 'set -- $(($1 + 1)) "$2" $3 "$4"' "$2"
    done
}

if command -v sed >/dev/null 2>&1; then
    _array_quote() {
        printf '%s\n' "$1" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/'/"
    }
else
    _array_quote() {
        printf "'%s'" "${1//\'/\'\\\'\'}"
    }
fi

_array_dump_ele_printer() {
    printf 'array_set %s %s %s\n' $4 $1 "$(_array_quote "$2")"
}

array_dump() {
    # $1 name
    printf 'array_def %s\n' $1
    array_foreach $1 _array_dump_ele_printer
}
