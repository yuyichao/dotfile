autoload -U is-at-least

command_not_found_handler() {
    local pkgs cmd="$1"
    if which pkgfile &> /dev/null; then
        pkgs=(${(f)"$(pkgfile -b -v -- "${cmd}" 2>/dev/null)"})
        if [[ -n "${pkgs}" ]]; then
            print -R "${cmd} may be found in the following packages:"
            for pkg in "${pkgs[@]}"; do
                print -R "  ${pkg}"
            done
            return 0
        fi
    elif which pacman &> /dev/null; then
        pkgs=(${(f)"$(pacman -F -- "${cmd}" 2>/dev/null)"})
        if [[ -n "${pkgs}" ]]; then
            print -R "${cmd} may be found in the following packages:"
            for pkg in "${pkgs[@]}"; do
                print -R "  ${pkg}"
            done
            return 0
        fi
    fi
    if is-at-least 5.3; then
        echo "zsh: command not found: ${cmd}"
    fi
    return 127
}
