# TODO

if which uname &> /dev/null && [[ $(uname -o 2> /dev/null) == "Msys" ]]; then
    # Workaround zsh autocompletion of windows drive path.
    # Ref https://github.com/msys2/MSYS2-packages/issues/38
    drives=$(mount | sed -rn 's#^[A-Z]: on /([a-z]).*#\1#p' | tr '\n' ' ')
    zstyle ':completion:*' fake-files /: "/:$drives"
    unset drives
fi

WORDCHARS=''

zmodload -i zsh/complist
# zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# should this be in keybindings?
# bindkey -M menuselect '^o' accept-and-infer-next-history

# zstyle ':completion:*:*:*:*:*' menu select

# kill
zstyle ':completion:*:*:kill:*:processes' list-colors \
    '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -A -o pid,user,comm -w -w"
zstyle ':completion:*:processes-names' command 'ps -e -o comm='

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order \
    local-directories directory-stack path-directories

# use /etc/hosts and known_hosts for hostname completion
[[ -r /etc/ssh/ssh_known_hosts ]] &&
_global_ssh_hosts=(${${${${(f)"$(</etc/ssh/ssh_known_hosts)"}:#[\|]*}%%\ *}%%,*}) ||
_ssh_hosts=()
[[ -r ~/.ssh/known_hosts ]] &&
_ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) ||
_ssh_hosts=()
[[ -r /etc/hosts ]] &&
: ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}} ||
_etc_hosts=()
hosts=(
  "$_global_ssh_hosts[@]"
  "$_ssh_hosts[@]"
  "$_etc_hosts[@]"
  "$HOST"
  localhost
)
zstyle ':completion:*:hosts' hosts $hosts

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH/cache/

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
        dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
        hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
        mailman mailnull mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
        operator pcap postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

# ... unless we really want to.
# zstyle '*' single-ignored show

expand-or-complete-with-dots() {
    echo -en "\e[31m......\e[0m"
    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
