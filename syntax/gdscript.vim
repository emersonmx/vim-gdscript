" Syntax file for GDScript

if exists("b:current_syntax")
    finish
endif
let b:current_syntax = "gdscript"

let s:save_cpo = &cpo
set cpo&vim

" Code here

let &cpo = s:save_cpo
unlet s:save_cpo
