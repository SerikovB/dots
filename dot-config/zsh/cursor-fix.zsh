#!/usr/bin/env zsh

cursor_mode() {
	cursor_block='\e[2 q'
	cursor_beam='\e[6 q'

	function zle-keymap-select {
		if [[ ${KEYMAP} == vicmd ]] || 
			[[ $1 = 'block' ]]; then
			echo -ne $cursor_block
		elif [[ ${KEYMAP} == main ]] ||
			[[ ${KEYMAP} == viins ]] ||
			[[ ${KEYMAP} = '' ]] ||
			[[ $1 = 'beam' ]]; then
			echo -ne $cursor_beam
		fi
	}

	zle-line-init() {
		echo -ne $cursor_beam
	}

	zle -N zle-keymap-select
    	zle -N zle-line-init
}

cursor_mode
