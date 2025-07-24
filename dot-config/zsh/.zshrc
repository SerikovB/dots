#!/usr/bin/env zsh
# Created by newuser for 5.9
#
# Auto cd
setopt AUTO_CD

# Push and pop
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

setopt CORRECT			# spelling
setopt CDABLE_VARS		# cd to path in variable
setopt EXTENDED_GLOB		# extended globbing syntax

# History
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

# Dircolors
eval $(dircolors ${XDG_CONFIG_HOME}/dircolors)

source "${ZDOTDIR}/completion.zsh"
source "${ZDOTDIR}/aliases.zsh"
source "${ZDOTDIR}/cursor-fix.zsh"
source "${ZDOTDIR}/extentions/zsh-bd/bd.zsh"
source "${ZDOTDIR}/extentions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "${ZDOTDIR}/keybinds.zsh"

eval "$(starship init zsh)"

# Sequences for terminal colors
# cat "${XDG_CACHE_HOME}/wallust/sequences"
