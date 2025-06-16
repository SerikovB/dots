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

source "${ZDOTDIR}/completion.zsh"
source "${ZDOTDIR}/extentions/zsh-bd/bd.zsh"
source "${ZDOTDIR}/extentions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "${ZDOTDIR}/keybinds.zsh"
