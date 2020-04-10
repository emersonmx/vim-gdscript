" Syntax file for GDScript

if exists("b:current_syntax")
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

syn keyword gdscriptConditional   if elif else match
syn keyword gdscriptRepeat        for while
syn keyword gdscriptOperator      and or not is in
syn match   gdscriptOperator      "\V&&\|||\|!\|&\|^\||\|~\|*\|/\|%\|+\|-\|=\|<\|>"
syn match   gdscriptDelimiter     "\V(\|)\|[\|]\|{\|}"
syn keyword gdscriptStatement     break continue pass return
syn keyword gdscriptKeyword       extends as self tool signal const enum var
                                \ onready export setget breakpoint preload yield
                                \ assert
syn match   gdscriptKeyword       "\v^\s*(((remote|master|puppet)\s*)=func)"
                                \ nextgroup=gdscriptFunction skipwhite
syn match   gdscriptKeyword       "\v^\s*(((remotesync|mastersync|puppetsync)\s*)=func)"
                                \ nextgroup=gdscriptFunction skipwhite
syn match   gdscriptKeyword       "\v^\s*((static\s*)=func|class)"
                                \ nextgroup=gdscriptFunction skipwhite
syn keyword gdscriptBoolean       true false

syn match   gdscriptMember   "\v<(\.)@<=[a-z_]+\w*>"
syn match   gdscriptFunction "\v<\w*>(\()@="
syn match   gdscriptSignal   "\v(<signal>\s+)@<=<\w+>"
syn match   gdscriptSetGet   "\v(<setget>\s+)@<=<\w+>"
syn match   gdscriptSetGet   "\v(<setget>\s+\w*\s*,\s*)@<=<\w+>"

syn keyword gdscriptNull       null
syn keyword gdscriptClass      int float bool
syn match   gdscriptClass      "\v<\u\w+>"
syn match   gdscriptConstant   "\v<[A-Z_]+[A-Z0-9_]*>"
syn keyword gdscriptClass      AABB IP JSON OS RID

syn match   gdscriptNode      "\v\$\a+\w*"

syn region  gdscriptString      start='\v\"' end='\v\"'
syn region  gdscriptString      start='\v\'' end='\v\''
syn match   gdscriptEscapeError "\v\\."              containedin=gdscriptString
syn match   gdscriptEscapeError "\v\\u.{,3}"         containedin=gdscriptString
syn match   gdscriptEscape      "\v\\[abfnrtv\\'"]"  containedin=gdscriptString
syn match   gdscriptEscape      "\v\\u[0-9]{4}"      containedin=gdscriptString

syn match   gdscriptFormat "\v\%\%" containedin=gdscriptString
syn match   gdscriptFormat "\v\%[+-]=(\d*|\*)=\.=(\d*|\*)=[scdoxXf]" containedin=gdscriptString

syn match   gdscriptNumber   "\v<\d+(\.)@!>"
syn match   gdscriptNumber   "\v<0x\x+(\.)@!>"
syn match   gdscriptNumber   "\v<0b[01]+(\.)@!>"
syn match   gdscriptFloat    "\v<\d*\.\d+(\.)@!>"
syn match   gdscriptFloat    "\v<\d*\.=\d+(e-=\d+)@="
syn match   gdscriptExponent "\v(\d*\.=\d+)@<=e-=\d+>"

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

hi def link gdscriptConditional Conditional
hi def link gdscriptRepeat      Repeat
hi def link gdscriptOperator    Operator
hi def link gdscriptDelimiter   Delimiter
hi def link gdscriptStatement   Statement
hi def link gdscriptKeyword     Keyword
hi def link gdscriptBoolean     Boolean

hi def link gdscriptMember   Identifier
hi def link gdscriptFunction Function
hi def link gdscriptSignal   Function
hi def link gdscriptSetGet   Function

hi def link gdscriptNull     Constant
hi def link gdscriptClass    Type
hi def link gdscriptConstant Constant
hi def link gdscriptNode     Identifier

hi def link gdscriptString   String
hi def link gdscriptEscape   Special
hi def link gdscriptFormat   Special
hi def link gdscriptNumber   Number
hi def link gdscriptFloat    Float
hi def link gdscriptExponent Special

hi def link gdscriptEscapeError Error

hi def link gdscriptComment Comment
hi def link gdscriptTodo    Todo

let b:current_syntax = "gdscript"

let &cpo = s:save_cpo
unlet s:save_cpo
