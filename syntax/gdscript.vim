" Syntax file for GDScript

if exists("b:current_syntax")
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

syn match   gdscriptComment       '#.*$' display contains=gdscriptTodo,@Spell
syn keyword gdscriptConditional    if elif else match
syn keyword gdscriptRepeat         for while
syn keyword gdscriptKeyword        break continue pass return is as tool signal
                                 \ const enum var onready export setget
                                 \ breakpoint preload yield assert class_name
syn keyword gdscriptKeyword        extends nextgroup=gdscriptFunction skipwhite
syn keyword gdscriptKeyword        func nextgroup=gdscriptFunction skipwhite
syn match   gdscriptKeyword        "\v^\s*((static\s*)=func)"
                                 \ nextgroup=gdscriptFunction skipwhite
syn match   gdscriptKeyword        "\v^\s*(((remote|master|puppet)\s*)=func)"
                                 \ nextgroup=gdscriptFunction skipwhite
syn match   gdscriptKeyword        "\v^\s*(((remote|master|puppet)sync\s*)=func)"
                                 \ nextgroup=gdscriptFunction skipwhite
syn match   gdscriptSetGet         "\v(<setget>\s+)@<=<\w+>"
syn match   gdscriptSetGet         "\v(<setget>\s+\w*\s*,\s*)@<=<\w+>"
syn match   gdscriptFunction       '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*' display contained
syn match   gdscriptFunctionCall   '\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\ze\%(\s*(\)'
syn keyword gdscriptClassVar       self
syn match   gdscriptOperator       '\V=\|-\|+\|*\|@\|/\|%\|&\||\|^\|~\|<\|>\|!=\|:='
syn keyword gdscriptOperator       and or in not
syn match   gdscriptNodePath       "\v\@([a-zA-Z_/][a-zA-Z0-9_/]+)?" nextgroup=gdscriptString
syn match   gdscriptNodePath       "\v\$([a-zA-Z_/][a-zA-Z0-9_/]+)?" nextgroup=gdscriptString
syn region  gdscriptString         start='\v\"' end='\v\"'
syn region  gdscriptString         start='\v\'' end='\v\''
syn match   gdscriptEscapeError    "\v\\."             containedin=gdscriptString
syn match   gdscriptEscapeError    "\v\\u.{,3}"        containedin=gdscriptString
syn match   gdscriptEscape         "\v\\[abfnrtv\\'"]" containedin=gdscriptString
syn match   gdscriptEscape         "\v\\u[0-9]{4}"     containedin=gdscriptString
syn match   gdscriptFormat         "\v\%\%" containedin=gdscriptString
syn match   gdscriptFormat         "\v\%[+-]=(\d*|\*)=\.=(\d*|\*)=[scdoxXf]" containedin=gdscriptString
syn match   gdscriptNumber         "\v<\d+(\.)@!>"
syn match   gdscriptNumber         "\v<0x\x+(\.)@!>"
syn match   gdscriptNumber         "\v<0b[01]+(\.)@!>"
syn match   gdscriptFloat          "\v<\d*\.\d+(\.)@!>"
syn match   gdscriptFloat          "\v<\d*\.=\d+(e-=\d+)@="
syn match   gdscriptExponent       "\v(\d*\.=\d+)@<=e-=\d+>"
syn keyword gdscriptConstant       null true false

syn match   gdscriptComment "\v#.*$"
syn keyword gdscriptTodo    TODO FIXME XXX NOTE BUG HACK OPTIMIZE containedin=gdscriptComment

syn region gdscriptFunctionFold
  \ start="\v^\z(\s*)%(%(static\s+)=func|class)>"
  \ end="\v\ze%(\s*\n)+%(\z1\s)@!."
  \ fold transparent

syn region gdscriptFold
  \ matchgroup=gdscriptComment
  \ start='#.*{{{.*$'
  \ end='#.*}}}.*$'
  \ fold transparent

hi def link gdscriptComment      Comment
hi def link gdscriptConditional  Conditional
hi def link gdscriptRepeat       Keyword
hi def link gdscriptKeyword      Keyword
hi def link gdscriptFunction     Function
hi def link gdscriptFunctionCall Function
hi def link gdscriptSetGet       Function
hi def link gdscriptClassVar     Identifier
hi def link gdscriptStatement    Special
hi def link gdscriptOperator     Keyword
hi def link gdscriptLiteral      Keyword
hi def link gdscriptNodePath     String
hi def link gdscriptString       String
hi def link gdscriptEscape       Special
hi def link gdscriptFormat       Special
hi def link gdscriptNumber       Number
hi def link gdscriptFloat        Float
hi def link gdscriptExponent     Float
hi def link gdscriptConstant     Constant

hi def link gdscriptTodo         Todo
hi def link gdEscapeError        Error

let b:current_syntax = "gdscript"

let &cpo = s:save_cpo
unlet s:save_cpo
