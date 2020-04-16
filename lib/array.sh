#!/bin/sh

# Array that only require posix-shell.
# Only variables used are:
# ${name}__array_len: length
# ${name}__array_${idx}: element, 1-base
# No other local variables are used.

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
# $2: total iteration
# ${@:3}: rest of the parameters passed to `array_foreach`
_array_loop() {
    # $1 iteration
    # $2 function
    # ${@:3} rest of arguments to pass to the callback
    set -- 1 "$(_array_make_rest_cmd_list 5 $(($# + 2)))" "$@"
    # $1 loop index
    # $2 string evals to rest of the arguments
    # $3 iteration
    # $4 function
    # ${@:5} rest of arguments to pass to the callback
    while test $1 -le $3; do
        eval '"$4"' $1 $3 "$2"
        eval 'set -- $(($1 + 1)) "$2" $3 "$4"' "$2"
    done
}

_array_set_len() {
    # $1 name
    # $2 length
    eval "${1}__array_len=$2"
}

array_length() {
    # $1 name
    # $2 var
    eval "$2=\${${1}__array_len}"
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
    eval test "\${${1}__array_len}" -lt $2
}

array_empty() {
    # $1 name
    _array_length_lt $1 1
}

array_clear() {
    # $1 name
    _array_set_len $1 0
}

array_def() {
    # $1 name
    array_clear $1
}

_array_push() {
    # $1 name
    # $2 new value
    eval set -- $1 '"$2"' "\${${1}__array_len}"
    _array_set $1 "$(($3 + 1))" "$2"
    _array_set_len $1 "$(($3 + 1))"
}

_array_push_cb() {
    # $1 index
    # $2 total length
    # $3 name
    # ${@:4} values
    eval _array_push $3 "\"\${$(($1 + 3))}\""
}

array_push() {
    # $1 name
    # ${@:2} new values
    eval _array_loop $(($# - 1)) _array_push_cb '"$@"'
}

array_pop() {
    # $1 name
    # $2 var
    eval set -- "$1" '"$2"' "\${${1}__array_len}"
    if test -n "$2"; then
        _array_get $1 $3 $2
    fi
    _array_set_len $1 "$(($3 - 1))"
}

array_min_len() {
    # $1 name
    # $2 length
    while _array_length_lt $1 $2; do
        _array_push $1 ''
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

_array_foreach_cb() {
    # $1 index
    # $2 total length
    # $3 string evals to rest of the arguments
    # $4 name
    # $5 function
    # ${@:6}
    eval '"$5"' $1 "\"\${${4}__array_${1}}\"" "$2" $4 "$3"
}

# Callback is called with
# $1 index
# $2 value
# $3 total length
# $4 array name
# ${@:5} rest of the parameters passed to `array_foreach`
array_foreach() {
    # $1 name
    # $2 function
    # ${@:3} rest of arguments to pass to the callback
    eval _array_loop "\${${1}__array_len}" \
         _array_foreach_cb '"$(_array_make_rest_cmd_list 6 $(($# + 3)))"' '"$@"'
}

_array_append_elfunc() {
    # $1: index
    # $2: value
    # $3: total length
    # $4: src array name
    # $5: dest array name
    _array_push $5 "$2"
}

array_append() {
    # $1 dest
    # $2 src
    array_foreach $2 _array_append_elfunc $1
}

_array_equal_elfunc() {
    # $1: index
    # $2: value
    # $3: total length
    # $4: array1 name
    # $5: array2 name
    if eval test "\"\${${5}__array_$1}\"" != "\"\$2\""; then
        echo 1
    fi
}

array_equal() {
    # $1: array1 name
    # $2: array2 name
    if eval test "\${${1}__array_len}" != "\${${2}__array_len}"; then
        return 1
    fi
    test -z "$(array_foreach $1 _array_equal_elfunc $2)"
}

_array_contains_elfunc() {
    # $1: index
    # $2: value
    # $3: total length
    # $4: array1 name
    # $5: probe value
    if test "$2" = "$5"; then
        echo 1
    fi
}

array_contains() {
    # $1: array1 name
    # $2: value
    test -n "$(array_foreach $1 _array_contains_elfunc "$2")"
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
