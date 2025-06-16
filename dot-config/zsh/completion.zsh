#!/usr/bin/env zsh
# Initialize compltion
zmodload zsh/complist
fpath=($ZDOTDIR/extentions/zsh-completions/src $fpath)
autoload -U compinit; compinit
_comp_opitios+=(globdots)

# Options
setopt MENU_COMPLETE
setopt AUTO_LIST
setopt COMPLETE_IN_WORD

# Zstyle
# Completer
zstyle ':completion:*' completer _extensions _complete _approximate

# Use menu
zstyle ':completion:*' menu select


# Compcache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME}/zsh/.zcompcache"

# Aliases
# :completion:<function>:<completer>:<command>:<argument>:<tag>
zstyle ':completion:*' complete true
zle -C alias-expantion complete-word _generic
zstyle ':completion:alias-expantion:*' completer _expand_alias

zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
