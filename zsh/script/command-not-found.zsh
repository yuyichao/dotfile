command_not_found_handler() {
    local pkgs cmd="$1"
    if ! which pkgfile &> /dev/null; then
        return 127
    fi
    pkgs=(${(f)"$(pkgfile -b -v -- "${cmd}" 2>/dev/null)"})
    if [[ -n "${pkgs}" ]]; then
        print -R "${cmd} may be found in the following packages:"
        for pkg in "${pkgs[@]}"; do
            print -R "  ${pkg}"
        done
        return 0
    fi
    return 127
}
