" Vim syntax file
" Language: arpa
" Maintainer: Adam Heins <mail@adamheins.com>
" Last Change: 2016-09-01

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syn match arpaHeading /@.*/ display

syn region arpaComment    start=/---/ end=/$/   display oneline
syn region arpaCodeInline start=/`/   end=/`/   display oneline
syn region arpaCodeBlock  start=/```/ end=/```/ display

hi def link arpaHeading    Function
hi def link arpaComment	   Comment
hi def link arpaCodeBlock  Statement
hi def link arpaCodeInline Statement

let b:current_syntax = "arpa"
